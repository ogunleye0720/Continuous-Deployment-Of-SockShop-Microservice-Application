resource "aws_flow_log" "eks_vpc_flow_logs" {
  log_destination      = data.aws_s3_bucket.selected-bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = data.aws_vpc.eks_vpc.id
}
