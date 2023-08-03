module "k8s" {
    source = "../../modules/k8s"  

    business_division = var.business_division    
    environment = var.environment
    aws_region = var.aws_region
    cluster_name = var.cluster_name
    cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr
    cluster_version = var.cluster_version
    cluster_endpoint_private_access = var.cluster_endpoint_private_access
    cluster_endpoint_public_access = var.cluster_endpoint_public_access
    cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
    eks_control_role = var.eks_control_role
    vpc_name = var.vpc_name
    
    nodegroup_role = var.nodegroup_role
    vpc_public_subnets = var.vpc_public_subnets
    vpc_private_subnets = var.vpc_private_subnets
    eks_nodegroup_list = var.eks_nodegroup_list
}