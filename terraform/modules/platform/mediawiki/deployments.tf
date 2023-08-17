resource "kubernetes_deployment_v1" "mediawiki_deployment" {
  metadata {
    name      = "mediawiki"
    namespace = var.namespace
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "mediawiki"
      }
    }

    template {
      metadata {
        labels = {
          app = "mediawiki"
        }
      }

      spec {
        container {
          name  = "mediawiki"
          image = "mediawiki:latest"

          port {
            container_port = 80
          }

          volume_mount {
            name       = "mediawiki-data"
            mount_path = "/var/www/html/images"
          }

          lifecycle {
            pre_stop {
              exec {
                command = ["/bin/sh", "-c", "echo 'Perform pre-shutdown tasks here'"]
              }
            }
          }
        }
        volume {
          name = "mediawiki-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.mediawiki_data_pvc.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment_v1" "mediawiki-db" {
  metadata {
    name      = "mediawiki-db"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mediawiki-db"
      }
    }

    template {
      metadata {
        labels = {
          app = "mediawiki-db"
        }
      }

      spec {
        container {
          name  = "mediawiki-db"
          image = "mysql:5.7"

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "rootpassword"
          }
          env {
            name  = "MYSQL_DATABASE"
            value = "mediawiki"
          }
          env {
            name  = "MYSQL_USER"
            value = "wikiuser"
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = "wikipassword"
          }

          volume_mount {
            name       = "mediawiki-db-storage"
            mount_path = "/var/lib/mysql"
          }
        }

        volume {
          name = "mediawiki-db-storage"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.mediawiki_db_pvc.metadata[0].name
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

