variable "kubeconfig" {
  description = "Archivo kubeconfig del cluster"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Contexto de kubectl, null usa el actual"
  type        = string
  default     = null
}

variable "image_tag" {
  description = "Tag de la imagen, vacio usa el appVersion del chart"
  type        = string
  default     = ""
}
