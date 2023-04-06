terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
  backend "s3" {
    bucket =  "ogunleye-bucket"
    key = "ingress/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state_lock"
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.ogunleye_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.ogunleye_cluster.certificate_authority[0].data)
  #version          = "2.16.1"
  config_path = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "ogunleye_cluster"]
    command     = "aws"
  }
}
