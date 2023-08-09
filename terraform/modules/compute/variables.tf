variable "environment" {
  description = "Infrastructure Environment"
  type        = string
}

variable "instance_name" {
  type        = string
  description = "Bastion Host EC2 Name"
}

variable "instance_type" {
  description = "Bastion Host EC2 Instance Type"
  type        = string
}

variable "instance_user" {
  description = "Bastion Host EC2 Instance User"
  type        = string
}

variable "key_pair_name" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public Subnet IDs"
}

variable "vpc_name" {
  description = "Cluster VPC Name"
  type        = string
}