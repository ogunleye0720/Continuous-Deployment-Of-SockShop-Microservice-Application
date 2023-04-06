resource "aws_iam_role" "ogunleye_worker" {
  name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "ogunleye_worker-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.ogunleye_worker.name
}

resource "aws_iam_role_policy_attachment" "ogunleye_worker-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.ogunleye_worker.name
}

resource "aws_iam_role_policy_attachment" "ogunleye_worker-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.ogunleye_worker.name
}

resource "aws_eks_node_group" "private_worker_nodes" {
  cluster_name    = aws_eks_cluster.ogunleye_cluster.name
  node_group_name = "private_worker_nodes"
  node_role_arn   = aws_iam_role.ogunleye_worker.arn
  subnet_ids      = data.aws_subnet.private_subnet.*.id


  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.ogunleye_worker-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ogunleye_worker-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ogunleye_worker-AmazonEC2ContainerRegistryReadOnly,
  ]
}
