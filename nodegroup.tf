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