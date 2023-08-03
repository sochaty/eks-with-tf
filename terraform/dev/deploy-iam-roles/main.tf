module "iam-role" {
    source = "../../modules/iam-role"
    business_division = var.business_division    
    environment = var.environment
    aws_region = var.aws_region
    cluster_roles = var.cluster_roles  
    nodegroup_roles = var.nodegroup_roles
}