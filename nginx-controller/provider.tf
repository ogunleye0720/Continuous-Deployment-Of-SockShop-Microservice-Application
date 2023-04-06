terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }

    kubernetes = {
        version = ">= 2.0.0"
        source = "hashicorp/kubernetes"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
  backend "s3" {
    bucket = "ogunleye-bucket"
    key = "nginx_controller/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state_lock"
  }
}


provider "helm" {
    kubernetes {
      config_path = "~/.kube/config"
    }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "kubectl" {
   load_config_file = false
   host                   = data.aws_eks_cluster.ogunleye_cluster.endpoint
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.ogunleye_cluster.certificate_authority[0].data)
   token                  = data.aws_eks_cluster_auth.ogunleye_auth.token
    config_path = "~/.kube/config"
}