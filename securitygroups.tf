
// security groups

resource "aws_security_group" "eks" {
#   count       = local.enabled ? 1 : 0
  name        = var.eks_security_group
  description = "Security Group for EKS cluster"
  vpc_id      = var.vpc_id
  tags        = var.asg_tags
}


// security rule

resource "aws_security_group_rule" "egress" {
#   count             = local.enabled ? 1 : 0
  description       = "Allow all egress traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = join("", aws_security_group.eks.*.id)
  type              = "egress"
}

