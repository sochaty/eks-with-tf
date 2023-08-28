resource "kubernetes_deployment_v1" "demoapp_deployment" {
  metadata {
    name = "demoapp-deployment"
    labels = {
      app = "demoapp"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "demoapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "demoapp"
        }
      }

      spec {
        container {
          name  = "nginx-container"
          image = "nginx:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# resource "kubernetes_namespace" "mediawiki" {
#   metadata {
#     name = var.namespace
#   }
# }

