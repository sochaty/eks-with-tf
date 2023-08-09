module "parameters" {

  source     = "../../modules/parameter-store"
  parameters = var.parameters

}

module "compute" {
  source = "../../modules/compute"

  environment       = module.parameters.values["/eks-with-tf/environment"]
  instance_name     = "${module.parameters.values["/eks-with-tf/business_division"]}-${module.parameters.values["/eks-with-tf/environment"]}"
  instance_type     = var.instance_type
  instance_user     = var.instance_user
  key_pair_name     = var.key_pair_name
  public_subnet_ids = split(",", module.parameters.values["/eks-with-tf/vpc_public_subnets"])
  vpc_name          = module.parameters.values["/eks-with-tf/vpc_name"]

  depends_on = [module.parameters]
}