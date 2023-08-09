module "parameters" {
  source     = "../../modules/parameter-store"
  parameters = var.parameters
}

module "k8s" {
  source = "../../modules/k8s"

  business_division                    = module.parameters.values["/eks-with-tf/business_division"]
  environment                          = module.parameters.values["/eks-with-tf/environment"]
  aws_region                           = module.parameters.values["/eks-with-tf/aws_region"]
  cluster_name                         = module.parameters.values["/eks-with-tf/cluster_name"]
  cluster_service_ipv4_cidr            = module.parameters.values["/eks-with-tf/cluster_service_ipv4_cidr"]
  cluster_version                      = module.parameters.values["/eks-with-tf/cluster_version"]
  cluster_endpoint_private_access      = tobool(module.parameters.values["/eks-with-tf/cluster_endpoint_private_access"])
  cluster_endpoint_public_access       = tobool(module.parameters.values["/eks-with-tf/cluster_endpoint_public_access"])
  cluster_endpoint_public_access_cidrs = split(",", module.parameters.values["/eks-with-tf/cluster_endpoint_public_access_cidrs"])
  eks_control_role                     = module.parameters.values["/eks-with-tf/eks_control_role"]
  vpc_name                             = module.parameters.values["/eks-with-tf/vpc_name"]

  nodegroup_role      = module.parameters.values["/eks-with-tf/nodegroup_role"]
  vpc_public_subnets  = split(",", module.parameters.values["/eks-with-tf/vpc_public_subnets"])
  vpc_private_subnets = split(",", module.parameters.values["/eks-with-tf/vpc_private_subnets"])
  eks_nodegroup_list  = var.eks_nodegroup_list

  depends_on = [module.parameters]
}