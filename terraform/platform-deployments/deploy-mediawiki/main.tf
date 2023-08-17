module "mediawiki" {

  source             = "../../modules/platform/mediawiki"
  storage_class_name = var.storage_class_name
  namespace          = var.namespace
}