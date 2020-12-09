# resource "kubernetes_config_map" "aws_auth" {
#   count      = var.create_eks && var.manage_aws_auth ? 1 : 0
#   depends_on = [null_resource.wait_for_cluster[0]]

#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#     labels = merge(
#       {
#         "app.kubernetes.io/managed-by" = "Terraform"
#       },
#       var.aws_auth_additional_labels
#     )
#   }

#   data = {
#     mapRoles = yamlencode(
#       distinct(concat(
#         local.configmap_roles,
#         var.map_roles,
#       ))
#     )
#     mapUsers    = yamlencode(var.map_users)
#     mapAccounts = yamlencode(var.map_accounts)
#   }
# }
