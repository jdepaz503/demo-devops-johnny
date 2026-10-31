# prod: mas margen de escalado y TLS con cert-manager, que tiene que estar instalado
module "demo_devops" {
  source = "../../modules/demo-devops"

  release_name = "demo-devops-prod"
  namespace    = "demo-devops-prod"
  chart_path   = "${path.module}/../../../charts/demo-devops"
  image_tag    = var.image_tag

  ingress_host         = "demo.127.0.0.1.sslip.io"
  min_replicas         = 2
  max_replicas         = 6
  cpu_target           = 60
  tls_enabled          = true
  cert_manager_enabled = true
  self_signed_issuer   = true
}
