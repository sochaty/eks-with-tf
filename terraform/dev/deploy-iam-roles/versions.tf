terraform {
  #   required_version = ">= 4.48.0"
  backend "s3" {
    bucket = "aws-terraform-demo"
    key    = "dev/eks-with-tf/iam-roles.tfstate"
    region = "us-east-1"

    dynamodb_table = "vpc-solution"
  }
}

provider "aws" {
  region = var.aws_region
}