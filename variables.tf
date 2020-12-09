
variable "eks_cluster_nodegroup_role_name" {
  type        = string
  description = "role name for eks cluster"
}

variable "eks_cluster_name" {
  type        = string
  description = "eks cluster name"
}

# variable "cluster_enabled_log_types" {
#   type        = string
# }

variable "cluster_version" {
  type        = any
  description = "kubernetes version"
}

variable "tags" {
  type        = map(string)
  default     = {}
}

# variable "subnets" {
#   type        = list(string)
#   description = "List of subnets to be created in our EKS Cluster."
# }
variable "aws_eks_node_instance_size" {
  type        = list(string)
}
variable "region" {
  type        = string
  description = "AWS Region"
}

variable "aws_eks_node_desired_size" {
  type        = any
}

variable "aws_eks_node_max_size" {
  type        = any
}

variable "aws_eks_nodegroup_name" {
  type        = string
}

variable "aws_eks_node_min_size" {
  type        = any
}

# variable "eks_cluster_security_group" {
#   type        = string
#   description = "eks_cluster_security_group name"
# }

# variable "vpc_id" {
#   type        = string
#   description = "vpc id"
# }

variable "sg_tags" {
  type        = map(string)
  default     = {}
}



// networking

# variable "private_subnets" {
#   type        = string
#   description = "List of private subnet CIDR blocks"
# }
# variable "vpc_cidr" {
#   type        = string
  
# }

# variable "azs" {
#   type        = string
#   default     = "us-east-1a"
# }
variable "subnet_ids" {
  type        = list(string)
}
variable "eks_cluster_role_name" {
  type        = string
}
variable "eks_nodegroup_role_name" {
  type        = string
}

// namespace

variable "namespace_name" {
  type        = string
  description = "namespaces to be created in our EKS Cluster."
}

// pods

variable "nginx_pod_name" {
  type        = string
  description = "pod name"
}

variable "nginx_pod_image" {
  type        = string
  description = "pod name"
}

//kms

variable "cluster_encryption_config_kms_key_enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled."
}
variable "cluster_encryption_config_kms_key_deletion_window_in_days" {
  type        = string
}
variable "kms_tags" {
  type        = map(string)
  default     = {}
}

# variable "eks_kms_name" {
#   type        = string
# }

// logs

variable "eks_cloudwatch_name" {
  type        = string
}

variable "cluster_log_retention_period" {
  type        = string
}
