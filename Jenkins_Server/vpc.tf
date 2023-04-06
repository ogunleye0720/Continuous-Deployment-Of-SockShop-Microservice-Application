# VPC CONFIGURATON SECTION

resource "random_string" "random" {
  length           = 2
  special          = true
  override_special = "/@£$"
}

resource "aws_vpc" "jenkins_vpc" {
  cidr_block = var.jenkins_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true


  tags = {
    "Name" = "jenkins_vpc_${random_string.random.id}"
  }

}