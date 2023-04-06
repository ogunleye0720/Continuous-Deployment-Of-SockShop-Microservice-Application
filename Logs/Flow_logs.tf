resource "aws_flow_log" "eks_vpc_flow_logs" {
  log_destination      = data.aws_s3_bucket.selected-bucket.id
  log_destination_type = "s3/eks_vpc-flow-logs"
  traffic_type         = "ALL"
  vpc_id               = data.aws_vpc.eks_vpc.id
}