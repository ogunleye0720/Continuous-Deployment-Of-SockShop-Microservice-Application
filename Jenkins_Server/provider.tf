terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "ogunleye-bucket"
    key = "jenkins_server/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state_lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
