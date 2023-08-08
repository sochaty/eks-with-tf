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