data "aws_eks_cluster" "ogunleye_cluster" {
  name = "ogunleye_cluster"
}
data "aws_eks_cluster_auth" "ogunleye_auth" {
  name = "ogunleye_auth_auth"
}