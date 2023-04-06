resource "aws_iam_role" "ogunleye_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "ogunleye_cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.ogunleye_cluster.name
}

resource "aws_iam_role_policy_attachment" "ogunleye_cluster-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.ogunleye_cluster.name
}


resource "aws_eks_cluster" "ogunleye_cluster" {
  name                      = "ogunleye_cluster"
  role_arn                  = aws_iam_role.ogunleye_cluster.arn
  enabled_cluster_log_types = ["audit", "api", "authenticator", "scheduler"]

  vpc_config {
    subnet_ids              = data.aws_subnet.all_subnets.*.id
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [aws_iam_role_policy_attachment.ogunleye_cluster-AmazonEKSClusterPolicy, aws_iam_role_policy_attachment.ogunleye_cluster-AmazonEC2ContainerRegistryReadOnly]
}