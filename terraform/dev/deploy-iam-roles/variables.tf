# AWS Region
variable "aws_region" {
  description = "Region Name"
  type        = string
  default     = "us-east-1"
}

variable "cluster_roles" {
  description = "Cluster Admin Roles"
  type = list(object({
    role_name   = string,
    policy_list = list(string)
  }))
}

variable "nodegroup_roles" {
  description = "Cluster Admin Roles"
  type = list(object({
    role_name   = string,
    policy_list = list(string)
  }))
}