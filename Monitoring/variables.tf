variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "namespace" {
  type    = string
  default = "monitoring"
}

variable "service_account" {
  description = "Name of the Service Account for Grafana"
  type        = string
  default     = ""
}

variable "service_account_annotations" {
  description = "Annotations for service account"
  type        = map(any)
  default     = {}
}

variable "replicas" {
  description = "Number of replicas of Grafana to run"
  type        = number
  default     = 1
}

variable "image" {
  description = "Docker Image for Grafana"
  type        = string
  default     = "grafana/grafana"
}

variable "tag" {
  description = "Docker Image tag for Grafana"
  type        = string
  default     = "8.1.2"
}

variable "image_pull_policy" {
  description = "Image Pull Policy for Grafana"
  type        = string
  default     = "IfNotPresent"
}

variable "extra_configmap_mounts" {
  description = "Extra ConfigMap to mount into the Container"
  type        = list(any)
  default     = []
}

variable "extra_empty_dir_mounts" {
  description = "Extra Empty DIRs to mount into the Container"
  type        = list(any)
  default     = []
}

variable "priority_class_name" {
  description = "Priority Class name for Grafana"
  type        = string
  default     = ""
}

variable "pod_annotations" {
  description = "Pod annotations"
  type        = map(any)
  default     = {}
}

variable "annotations" {
  description = "Deployment annotations"
  type        = map(any)
  default     = {}
}

variable "service_type" {
  description = "Service type"
  type        = string
  default     = "ClusterIP"
}

variable "service_port" {
  description = "Port of the service"
  type        = string
  default     = "80"
}

variable "service_target_port" {
  description = "Port in container to expose service"
  type        = string
  default     = "3000"
}

variable "service_annotations" {
  description = "Annotations for the service"
  type        = map(any)
  default     = {}
}

variable "service_labels" {
  description = "Labels for the service"
  type        = map(any)
  default     = {}
}

variable "ingress_enabled" {
  description = "Enable Ingress"
  type        = bool
  default     = false
}

variable "ingress_annotations" {
  description = "Annotations for ingress"
  type        = map(any)
  default     = {}
}

variable "ingress_labels" {
  description = "Labels for ingress"
  type        = map(any)
  default     = {}
}

variable "ingress_hosts" {
  description = "Hosts for ingress"
  type        = list(any)
  default     = []
}

variable "ingress_tls" {
  description = "TLS configuration for ingress"
  type        = list(any)
  default     = []
}

variable "resources" {
  description = "Resources for Grafana container"
  type        = map(any)
  default     = {}
}

variable "node_selector" {
  description = "Node selector for Pods"
  type        = map(any)
  default     = {}
}

variable "tolerations" {
  description = "Tolerations for pods"
  type        = list(any)
  default     = []
}

variable "affinity" {
  description = "Pod affinity"
  type        = map(any)
  default     = {}
}

variable "security_context" {
  description = "Security context for pods defined as a map which will be serialized to JSON."
  type        = any
  default = {
    runAsGroup = 472
    runAsUser  = 472
    fsGroup    = 472
  }
}

variable "extra_init_containers" {
  description = "Extra init containers"
  type        = list(any)
  default     = []
}

variable "extra_containers" {
  description = "YAML string for extra containers"
  type        = string
  default     = ""
}

variable "persistence_enabled" {
  description = "Enable PV"
  type        = bool
  default     = false
}

variable "persistence_storage_class_name" {
  description = "Storage Class name for the PV"
  type        = string
  default     = "default"
}

variable "persistence_annotations" {
  description = "Annotations for the PV"
  type        = map(any)
  default     = {}
}

variable "persistence_size" {
  description = "Size of the PV"
  type        = string
  default     = "10Gi"
}

variable "persistence_existing_claim" {
  description = "Use an existing PVC"
  type        = string
  default     = ""
}