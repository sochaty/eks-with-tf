resource "kubernetes_service_v1" "demoapp_lb_service" {
  metadata {
    name = "demoapp-lb-service"
    # namespace = var.namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.demoapp_deployment.spec.0.selector.0.match_labels.app
    }

    type = "LoadBalancer"

    port {
      name        = "http"
      port        = 80
      target_port = 80
    }
  }
}