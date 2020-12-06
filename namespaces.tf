resource "kubernetes_namespace" "default" {
  for_each = toset(var.namespaces)
  metadata {
        annotations = {
              name = each.key
            }
            name = each.key
          }
        }