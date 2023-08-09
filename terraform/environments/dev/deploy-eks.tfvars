aws_region = "us-east-1"

eks_nodegroup_list = [
  {
    name           = "finance-dev-eksdemo1-eks-ng-public"
    is_private     = false
    ami_type       = "AL2_x86_64"
    capacity_type  = "ON_DEMAND"
    disk_size      = 20
    instance_types = ["t3.medium"]
    remote_access = {
      ec2_ssh_key = "demokey1"
    }
    scaling = {
      expected = 1
      min      = 1
      max      = 2
    }
    update_config = {
      max_unavailable = 1
    }
  },
  {
    name           = "finance-dev-eksdemo1-eks-ng-private"
    is_private     = true
    ami_type       = "AL2_x86_64"
    capacity_type  = "ON_DEMAND"
    disk_size      = 20
    instance_types = ["t3.medium"]
    remote_access = {
      ec2_ssh_key = "demokey1"
    }
    scaling = {
      expected = 1
      min      = 1
      max      = 2
    }
    update_config = {
      max_unavailable = 1
    }
  }
]

parameters = ["/eks-with-tf/aws_region", "/eks-with-tf/business_division", "/eks-with-tf/environment",
  "/eks-with-tf/cluster_name", "/eks-with-tf/cluster_service_ipv4_cidr", "/eks-with-tf/cluster_version",
  "/eks-with-tf/cluster_endpoint_private_access", "/eks-with-tf/cluster_endpoint_public_access", "/eks-with-tf/cluster_endpoint_public_access_cidrs",
  "/eks-with-tf/eks_control_role", "/eks-with-tf/nodegroup_role", "/eks-with-tf/vpc_name", "/eks-with-tf/vpc_public_subnets",
"/eks-with-tf/vpc_private_subnets"]