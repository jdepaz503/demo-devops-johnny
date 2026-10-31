locals {
  usa_cert_manager = var.tls_enabled && var.cert_manager_enabled

  # helm recibe todo como texto, de ahi los tostring
  todos = {
    "ingress.host"                                   = var.ingress_host
    "image.tag"                                      = var.image_tag
    "replicaCount"                                   = tostring(var.replica_count)
    "autoscaling.enabled"                            = tostring(var.autoscaling_enabled)
    "autoscaling.minReplicas"                        = tostring(var.min_replicas)
    "autoscaling.maxReplicas"                        = tostring(var.max_replicas)
    "autoscaling.targetCPUUtilizationPercentage"     = tostring(var.cpu_target)
    "ingress.tls.enabled"                            = tostring(var.tls_enabled)
    "ingress.tls.certManager.enabled"                = tostring(local.usa_cert_manager)
    "ingress.tls.certManager.createSelfSignedIssuer" = tostring(local.usa_cert_manager && var.self_signed_issuer)
  }

  # lo que viene vacio no se manda, asi el chart usa su valor por defecto
  valores = { for k, v in local.todos : k => v if v != "" }
}

resource "helm_release" "app" {
  name             = var.release_name
  namespace        = var.namespace
  chart            = var.chart_path
  create_namespace = true
  reset_values     = true
  wait             = true
  timeout          = var.timeout_seconds

  set = [for k, v in local.valores : { name = k, value = v }]

  lifecycle {
    precondition {
      condition     = var.max_replicas >= var.min_replicas
      error_message = "max_replicas no puede ser menor que min_replicas."
    }
  }
}
