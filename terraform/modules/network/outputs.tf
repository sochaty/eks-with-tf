# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = data.aws_subnets.private-subnets.ids
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = data.aws_subnets.public-subnets.ids
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.elastic-ip-for-nat-gw.public_ip
}

# VPC AZs

output "list_of_private_azs" {
  description = "A list of private availability zones"
  value       = aws_subnet.private-subnet[*].availability_zone
}

output "list_of_public_azs" {
  description = "A list of public availability zones"
  value       = aws_subnet.public-subnet[*].availability_zone
}