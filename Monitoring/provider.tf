provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kube_config)
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

provider "kubectl" {
   load_config_file = false
   host                   = data.aws_eks_cluster.ogunleye_cluster.endpoint
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.ogunleye_cluster.certificate_authority[0].data)
   token                  = data.aws_eks_cluster_auth.ogunleye_auth.token
    config_path = pathexpand(var.kube_config)
}

provider "aws" {
  region     = "us-east-1"
}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
  backend "s3" {
    bucket = "ogunleye-bucket" 
    key = "Eks_Monitoring/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state_lock"
  }
}