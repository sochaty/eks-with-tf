data "terraform_remote_state" "eks_state" {
  backend = "s3"
  config = {
    bucket = "aws-terraform-demo"
    key    = "dev/eks-with-tf/eks.tfstate"
    region = "us-east-1"
  }
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks_state.outputs.cluster_id
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = data.terraform_remote_state.eks_state.outputs.cluster_id
}