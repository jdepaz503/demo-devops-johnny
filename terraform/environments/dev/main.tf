# dev: sin TLS para que corra en cualquier cluster, incluso uno recien creado
module "demo_devops" {
  source = "../../modules/demo-devops"

  release_name = "demo-devops-dev"
  namespace    = "demo-devops-dev"
  chart_path   = "${path.module}/../../../charts/demo-devops"
  image_tag    = var.image_tag

  ingress_host = "demo-dev.127.0.0.1.sslip.io"
  min_replicas = 2
  max_replicas = 3
}
