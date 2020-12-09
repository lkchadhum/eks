
# // Namespaces

resource "kubernetes_namespace" "infra" {
  metadata {
    annotations = {
      name = var.namespace_name
    }

    labels = {
      mylabel = "label-value"
    }

    name = var.namespace_name
  }
}

// pods

# resource "kubernetes_pod" "nginx" {
#   metadata {
#     name      = var.nginx_pod_name
#     namespace = var.namespace_name
    
#   }
#   spec {
#     container {
#       name  = var.nginx_pod_name
#       image = var.nginx_pod_image
#     }
#   }
# }
# resource "kubernetes_service" "nginx" {
#   metadata {
#     name      = var.nginx_pod_name
#     namespace = var.namespace_name
#   }
#   spec {
#     selector {
#       app = "nginx"
#     }
#     port {
#       port = 8080
#       target_port = 80
#     }
#     type = LoadBalancer
#   }
# }

# resource "kubernetes_pod" "pod" {
#   metadata {
#     name = "nginx"
#     labels = {
#       app = "nginx"
#     }
#   }

#   spec {
#     container {
#       image = "nginx:1.7.9"
#       name  = "nginx"

#       port {
#         container_port = 8080
#       }
#     }
#   }
# }