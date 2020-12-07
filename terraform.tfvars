
eks_cluster_nodegroup_role_name = "eks-learning-nodegropup-mname"
eks_cluster_name = "eks-learning"
cluster_version = "1.15"


// not hardcoding subnet_ids,passing it on run time

subnet_ids = []
aws_eks_node_instance_size = ["t3.medium"]
region = "us-east-1"
aws_eks_node_desired_size = "1"

aws_eks_node_max_size  = "1"

aws_eks_node_min_size = "1"

aws_eks_nodegroup_name = "eks-cluster-learning-test-nodegroup"

namespaces = ["helm", "infrastructure"]

eks_cluster_role_name = "edx-qa-kube-cluster-role-name"

eks_nodegroup_role_name = "eks-cluster-nodegroup-role-name"