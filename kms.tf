resource "aws_kms_key" "cluster" {
  description             = "EKS Cluster Encryption Config KMS Key"
  enable_key_rotation     = var.cluster_encryption_config_kms_key_enable_key_rotation
  deletion_window_in_days = var.cluster_encryption_config_kms_key_deletion_window_in_days
  policy                  = var.cluster_encryption_config_kms_key_policy
  tags                    = var.kms_tags
}

resource "aws_kms_alias" "cluster" {
  name          = var.eks_kms_name
  target_key_id = join("", aws_kms_key.cluster.*.key_id)
}