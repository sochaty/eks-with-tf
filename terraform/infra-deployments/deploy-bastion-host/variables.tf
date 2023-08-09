variable "aws_region" {
  description = "Region Name"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Bastion Host EC2 Instance Type"
  type        = string
  #   default = "t3.micro"  
}

variable "instance_user" {
  description = "Bastion Host EC2 Instance User"
  type        = string
  #   default = "t3.micro"  
}

variable "key_pair_name" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
}

variable "parameters" {
  type = set(string)
}