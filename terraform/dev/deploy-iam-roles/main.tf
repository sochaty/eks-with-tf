module "iam-role" {
    source = "../../modules/iam-role"
    business_division = var.business_division    
    environment = var.environment
    aws_region = var.aws_region
    count = length(var.iam_roles)
    
    iam_role = var.iam_roles[count.index]    
}