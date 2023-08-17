resource "kubernetes_service_v1" "mediawiki_service" {
  metadata {
    name      = "mediawiki"
    # namespace = var.namespace
  }

  spec {
    selector = {
      app = "mediawiki"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 80
    }
  }
}