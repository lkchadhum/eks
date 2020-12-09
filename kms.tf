

data "aws_iam_policy_document" "kms" {
  statement {
    effect = "Allow"

    sid = "Enable default account access to key"

    resources = [
      "*",
    ]

    actions = [
      "kms:*",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*"
      ]
    }
  }
}


resource "aws_kms_key" "cluster" {
  description             = "EKS Cluster Encryption Config KMS Key"
  enable_key_rotation     = var.cluster_encryption_config_kms_key_enable_key_rotation
  deletion_window_in_days = var.cluster_encryption_config_kms_key_deletion_window_in_days
  policy                  = data.aws_iam_policy_document.kms.json
  tags                    = var.kms_tags
}

resource "aws_kms_alias" "cluster" {
  name          = "alias/qa-kms"
  target_key_id = join("", aws_kms_key.cluster.*.key_id)
}

output "secrets_kms_key" {
  value = aws_kms_key.cluster.key_id
}
output "secrets_kms_arn" {
  value = aws_kms_key.cluster.arn
}