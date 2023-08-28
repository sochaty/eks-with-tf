terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.65"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20"
    }
  }

  backend "s3" {
    bucket = "aws-terraform-demo"

    key = "dev/eks-with-tf/mediawiki.tfstate"

    region = "us-east-1"

    dynamodb_table = "vpc-solution"
  }
}