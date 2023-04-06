# Retrieves the S3 bucket name
data "aws_s3_bucket" "selected-bucket" {
  bucket = "ogunleye-bucket"
}

# Retrieves the vpc name
data "aws_vpc" "eks_vpc" {
  filter {
    name   = "tag:Name"
    values = ["ogunleye_eks_vpc"]
  }
}