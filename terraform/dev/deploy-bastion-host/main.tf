module "compute" {
    source = "../../modules/compute"  

    aws_region = var.aws_region
    business_division = var.business_division
    environment = var.environment
    instance_name = var.instance_name
    instance_type = var.instance_type
    instance_user = var.instance_user
    key_pair_name = var.key_pair_name
    public_subnet_ids = var.public_subnet_ids
    vpc_name = var.vpc_name
}