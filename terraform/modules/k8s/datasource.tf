data "aws_iam_role" "eks_control_plane_role" {
  name = var.eks_control_role
}

data "aws_iam_role" "eks_nodegroup_role" {
  name = var.nodegroup_role
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }  
}

data "aws_subnets" "private-subnets" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  
  filter {
    name   = "tag:Name"
    values = ["Private-Subnet-*"]
  }  
}

data "aws_subnets" "public-subnets" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["Public-Subnet-*"]
  }  
}

# data "aws_vpc" "cluster_vpc" {
#   id = var.vpc_id
# }

# resource "aws_subnet" "public_subnet" {
#   vpc_id            = data.aws_vpc.cluster_vpc.id
#   # availability_zone = "us-west-2a"
#   cidr_block        = cidrsubnet(data.aws_vpc.cluster_vpc.cidr_block, 4, 1)
# }