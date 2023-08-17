resource "kubernetes_persistent_volume_claim_v1" "mediawiki_data_pvc" {
  metadata {
    name      = "mediawiki-data"
    # namespace = var.namespace
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    # storage_class = var.storage_class_name

    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "mediawiki_db_pvc" {
  metadata {
    name      = "mediawiki-db-storage"
    # namespace = var.namespace
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    # storage_class = var.storage_class_name

    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}