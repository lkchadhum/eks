resource "aws_cloudwatch_log_group" "eks" {
  name              = var.eks_cloudwatch_name
  retention_in_days = var.cluster_log_retention_period
  tags              = var.tags
}