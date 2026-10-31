variable "release_name" {
  description = "Nombre del release de Helm"
  type        = string
  default     = "demo-devops"
}

variable "namespace" {
  description = "Namespace donde se instala"
  type        = string
  default     = "demo-devops"
}

variable "chart_path" {
  description = "Ruta al chart (todavia no esta publicado en ningun registro)"
  type        = string
}

variable "image_tag" {
  description = "Tag de la imagen, vacio usa el appVersion del chart"
  type        = string
  default     = ""
}

variable "autoscaling_enabled" {
  description = "Activa el HPA"
  type        = bool
  default     = true
}

variable "min_replicas" {
  description = "Minimo de replicas con el HPA activo"
  type        = number
  default     = 2
}

variable "max_replicas" {
  description = "Maximo de replicas con el HPA activo"
  type        = number
  default     = 5
}

variable "replica_count" {
  description = "Replicas fijas, solo cuenta si el HPA esta apagado"
  type        = number
  default     = 2
}

variable "cpu_target" {
  description = "Porcentaje de CPU objetivo para el HPA"
  type        = number
  default     = 50
}

variable "ingress_host" {
  description = "Host del Ingress"
  type        = string
  default     = "demo-devops.local"
}

variable "tls_enabled" {
  description = "Publica el Ingress con TLS"
  type        = bool
  default     = false
}

variable "cert_manager_enabled" {
  description = "Pide el certificado con cert-manager (tiene que estar instalado)"
  type        = bool
  default     = false
}

variable "self_signed_issuer" {
  description = "Crea un Issuer autofirmado, solo para laboratorio"
  type        = bool
  default     = false
}

variable "timeout_seconds" {
  description = "Tiempo maximo de espera del despliegue"
  type        = number
  default     = 300
}
