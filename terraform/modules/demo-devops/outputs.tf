output "release_name" {
  description = "Nombre del release"
  value       = helm_release.app.name
}

output "namespace" {
  description = "Namespace del release"
  value       = helm_release.app.namespace
}

output "status" {
  description = "Estado del release en Helm"
  value       = helm_release.app.status
}

output "url" {
  description = "URL por donde sale la API"
  value       = "${var.tls_enabled ? "https" : "http"}://${var.ingress_host}"
}
