resource "kubernetes_namespace" "monitoring" {
  depends_on = [data.aws_eks_node_group.eks-node-group, time_sleep.wait_for_kubernetes]
  metadata {
    name = var.namespace
  }
}
