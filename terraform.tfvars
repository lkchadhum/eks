
eks_cluster_nodegroup_role_name = "eks-learning-nodegropup-mname"
eks_cluster_name = "eks-learning"
cluster_version = "1.15"


// not hardcoding subnet_ids,passing it on run time

subnet_ids = ["subnet-05551c1117b6934c5", "subnet-0133bd88b4d8773f7"]
region = "us-east-1"

aws_eks_node_instance_size = ["t3.medium"]
aws_eks_node_desired_size = "2"
aws_eks_node_max_size  = "3"
aws_eks_node_min_size = "1"
aws_eks_nodegroup_name = "eks-cluster-learning-test-nodegroup"

eks_cluster_role_name = "edx-qa-kube-cluster-role-name"
eks_nodegroup_role_name = "eks-cluster-nodegroup-role-name"

namespace_name = "app"
nginx_pod_name  = "nginx-eks"
nginx_pod_image = "nginx:1.14.2"


// kms

cluster_encryption_config_kms_key_enable_key_rotation = "true"
cluster_encryption_config_kms_key_deletion_window_in_days = "10"
# eks_kms_name = "kms"

// logs
eks_cloudwatch_name = "eks-test-cloudwatch"
cluster_log_retention_period = "14"