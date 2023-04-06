resource "time_sleep" "wait_for_Eks_vpc" {
  depends_on = [
    data.aws_vpc.eks_vpc
  ]

  create_duration = "60s"
}