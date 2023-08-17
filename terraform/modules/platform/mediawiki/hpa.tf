resource "kubernetes_horizontal_pod_autoscaler_v1" "mediawiki_hpa" {
  metadata {
    name      = "mediawiki-hpa"
    # namespace = var.namespace
  }

  spec {
    scale_target_ref {
      #   deployment_name = kubernetes_deployment_v1.mediawiki_deployment.metadata[0].name
      name = "mediawiki-hpa"
      kind = "HorizontalPodAutoscaler"
    }

    min_replicas = 2
    max_replicas = 5

    # metric {
    #   type = "Resource"
    #   resource {
    #     name = "cpu"
    #     target = {
    #       type                = "Utilization"
    #       average_utilization = 80
    #     }
    #   }
    # }
  }
}
