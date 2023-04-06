variable "bucket_name" {
  type = string
  default = "ogunleye-bucket"
}

variable "key" {
  type = string
  default = "ingress/terraform.tfstate"
}

variable "db_state_lock" {
  type = string
  default = "state_lock"
}