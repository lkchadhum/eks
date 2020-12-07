resource "aws_eks_node_group" "nodegroups" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.aws_eks_nodegroup_name

  # check the node arn for this 
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.aws_eks_node_instance_size
  scaling_config {
    desired_size = var.aws_eks_node_desired_size
    max_size     = var.aws_eks_node_max_size
    min_size     = var.aws_eks_node_min_size
  }

########## check the roles and policy attached here
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}

##### encryption



# resource "aws_eks_node_group" "workers" {
#   for_each = local.node_groups_expanded

#   node_group_name = lookup(each.value, "name", join("-", [var.cluster_name, each.key, random_pet.node_groups[each.key].id]))

#   cluster_name  = var.cluster_name
#   node_role_arn = each.value["iam_role_arn"]
#   subnet_ids    = each.value["subnets"]

#   scaling_config {
#     desired_size = each.value["desired_capacity"]
#     max_size     = each.value["max_capacity"]
#     min_size     = each.value["min_capacity"]
#   }

#   ami_type        = lookup(each.value, "ami_type", null)
#   disk_size       = lookup(each.value, "disk_size", null)
#   instance_types  = each.value["launch_template_id"] != null ? [] : [each.value["instance_type"]]
#   release_version = lookup(each.value, "ami_release_version", null)

#   dynamic "remote_access" {
#     for_each = each.value["key_name"] != "" ? [{
#       ec2_ssh_key               = each.value["key_name"]
#       source_security_group_ids = lookup(each.value, "source_security_group_ids", [])
#     }] : []

#     content {
#       ec2_ssh_key               = remote_access.value["ec2_ssh_key"]
#       source_security_group_ids = remote_access.value["source_security_group_ids"]
#     }
#   }

#   dynamic "launch_template" {
#     for_each = each.value["launch_template_id"] != null ? [{
#       id      = each.value["launch_template_id"]
#       version = each.value["launch_template_version"]
#     }] : []

#     content {
#       id      = launch_template.value["id"]
#       version = launch_template.value["version"]
#     }
#   }

#   version = lookup(each.value, "version", null)

#   labels = merge(
#     lookup(var.node_groups_defaults, "k8s_labels", {}),
#     lookup(var.node_groups[each.key], "k8s_labels", {})
#   )

#   tags = merge(
#     var.tags,
#     lookup(var.node_groups_defaults, "additional_tags", {}),
#     lookup(var.node_groups[each.key], "additional_tags", {}),
#   )

#   lifecycle {
#     create_before_destroy = true
#     ignore_changes        = [scaling_config.0.desired_size]
#   }

#   depends_on = [var.ng_depends_on]
# }