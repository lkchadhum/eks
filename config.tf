# resource "kubernetes_config_map" "aws_auth" {
#   count      = var.create_eks && var.manage_aws_auth ? 1 : 0
#   depends_on = [null_resource.wait_for_cluster[0]]

#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#     labels = merge(
#       {
#         "app.kubernetes.io/managed-by" = ""
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



# provider "kubernetes" {
#   config_path      = local_file.kubeconfig.filename
#   load_config_file = true
# }

# resource "local_file" "kubeconfig" {
#   content  = var.kubeconfig
#   filename = "${path.module}/kubeconfig"
# }

# provider "kubernetes" {
#   host = ""

#   client_certificate     = "${file("~/.kube/client-cert.pem")}"
#   client_key             = "${file("~/.kube/client-key.pem")}"
#   cluster_ca_certificate = "${file("~/.kube/cluster-ca-cert.pem")}"
# }