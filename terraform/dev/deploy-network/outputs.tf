# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.network.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.network.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.network.nat_public_ips
}

# VPC AZs

output "list_of_private_azs" {
    description = "A list of private availability zones"
    value = module.network.list_of_private_azs
}

output "list_of_public_azs" {
  description = "A list of public availability zones"
  value = module.network.list_of_public_azs
}

output "list_of_db_azs" {
  description = "A list of public availability zones"
  value = module.network.list_of_db_azs
}