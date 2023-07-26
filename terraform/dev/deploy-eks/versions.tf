terraform {
  #   required_version = ">= 4.48.0"
  backend "s3" {
    bucket = "aws-terraform-demo"
    key    = "dev/eks-with-tf/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "vpc-solution"
  }
}

provider "aws" {
<<<<<<< HEAD:terraform/dev/deploy-iam-roles/versions.tf
  region = var.aws_region
=======
  region = var.region
>>>>>>> main:terraform/dev/deploy-eks/versions.tf
}