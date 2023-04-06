data "aws_eks_node_group" "eks-node-group" {
  cluster_name = "ogunleye_cluster"
  node_group_name = "private_worker_nodes"
}

resource "time_sleep" "wait_for_kubernetes" {

    depends_on = [
        data.aws_eks_cluster.ogunleye_cluster
    ]

    create_duration = "20s"
}

data "aws_eks_cluster" "ogunleye_cluster" {
  name = "ogunleye_cluster"
}
data "aws_eks_cluster_auth" "ogunleye_auth" {
  name = "ogunleye_auth"
}