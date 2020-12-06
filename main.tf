resource "aws_eks_cluster" "eks_cluster" {  
  name                      = "${var.eks_cluster_name}"  
  # enabled_cluster_log_types = var.cluster_enabled_log_types  
  role_arn                  = "${aws_iam_role.eks_cluster.arn}"  
  version                   = "${var.cluster_version}"  
  tags                      = "${var.tags}"    
  vpc_config {   
    # security_group_ids      = compact([local.cluster_security_group_id])   
    subnet_ids              = "${var.subnets}"    
    # endpoint_private_access = var.cluster_endpoint_private_access    
    # endpoint_public_access  = var.cluster_endpoint_public_access    
    # public_access_cidrs     = var.cluster_endpoint_public_access_cidrs  
    }
    # timeouts {
    #   create = var.cluster_create_timeout
    #   delete = var.cluster_delete_timeout]
    #   }
  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy,
  ]
}
