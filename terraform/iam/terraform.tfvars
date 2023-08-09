aws_region = "us-east-1"

cluster_roles = [
  {
    role_name = "finance-dev-eks-cluster-role"
    policy_list = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]
  }
]

nodegroup_roles = [
  {
    role_name = "finance-dev-eks-nodegroup-role"
    policy_list = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
      "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
  }
]