terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "ogunleye-bucket"
    key =  "flow_logs/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state_lock"
  }
}

provider "aws" {
  region = "us-east-1"
}
