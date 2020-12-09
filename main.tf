resource "aws_eks_cluster" "eks_cluster" {
  name                      = var.eks_cluster_name
  # enabled_cluster_log_types = var.cluster_enabled_log_types
  role_arn                  = aws_iam_role.eks_cluster.arn
  version                   = var.cluster_version
  tags = {
    Name = "eks"
  }  
  vpc_config {
    # security_group_ids      = compact([local.cluster_security_group_id])
    subnet_ids              = var.subnet_ids
    # endpoint_private_access = var.cluster_endpoint_private_access
    # endpoint_public_access  = var.cluster_endpoint_public_access
    # public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

#   timeouts {
#     create = var.cluster_create_timeout
#     delete = var.cluster_delete_timeout
#   }

### for now we dont encryption ######

  # dynamic encryption_config {
  #   for_each = toset(var.cluster_encryption_config)

  #   content {
  #     provider {
  #       key_arn = encryption_config.value["provider_key_arn"]
  #     }
  #     resources = encryption_config.value["resources"]
  #   }
  # }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    # aws_cloudwatch_log_group.default
  ]
}

#### encryption
##### namespaces
##### cloud watch