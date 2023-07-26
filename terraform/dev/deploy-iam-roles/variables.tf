# AWS Region
variable "aws_region" {
  description = "Region Name"
  type = string 
  default = "us-east-1"
}

variable "business_division" {
  description = "Team"
  type = string 
}

variable "environment" {
  description = "Infrastructure Environment"
  type = string 
}

variable "iam_roles" {
    description = "Cluster Admin Roles"
    type = list(object({
      role_name = string,
      policy_list = list(string)
    }))
}

# variable "nodegroup_role" {
#     description = "value"
#     type = object({
#       role_name = string,
#       policy_list = list(string)
#     })
# }