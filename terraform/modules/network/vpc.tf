resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "${local.name}-${var.vpc_name}-VPC"
    Owners = "${local.owners}"
    Environment = "${local.environment}"
  }
  
}