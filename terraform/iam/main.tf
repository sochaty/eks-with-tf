module "iam-role" {
  source = "../modules/iam-role"

  cluster_roles   = var.cluster_roles
  nodegroup_roles = var.nodegroup_roles
}