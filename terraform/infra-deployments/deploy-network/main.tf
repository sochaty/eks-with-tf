module "parameters" {

  source     = "../../modules/parameter-store"
  parameters = var.parameters

}

module "network" {

  source                 = "../../modules/network"
  business_division      = module.parameters.values["/eks-with-tf/business_division"]
  environment            = module.parameters.values["/eks-with-tf/environment"]
  vpc_availability_zones = split(",", module.parameters.values["/eks-with-tf/vpc_availability_zones"])
  vpc_cidr_block         = module.parameters.values["/eks-with-tf/vpc_cidr_block"]
  vpc_public_subnets     = split(",", module.parameters.values["/eks-with-tf/vpc_public_subnets"])
  vpc_private_subnets    = split(",", module.parameters.values["/eks-with-tf/vpc_private_subnets"])


  depends_on = [module.parameters]
}