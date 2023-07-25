module "network" {
    source = "../../modules/network"
    business_division = var.business_division    
    environment = var.environment
    vpc_availability_zones = var.vpc_availability_zones
    vpc_cidr_block = var.vpc_cidr_block
    vpc_public_subnets = var.vpc_public_subnets
    vpc_private_subnets = var.vpc_private_subnets
    vpc_database_subnets = var.vpc_database_subnets
    zones = var.vpc_availability_zones
}