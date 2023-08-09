# Define Local Scope Data
locals {
  cluster_policies = flatten([
    for role in var.cluster_roles :
    [for policy_arn in role.policy_list : {
      role_name  = role.role_name
      policy_arn = policy_arn
    }]
  ])
  nodegroup_policies = flatten([
    for role in var.nodegroup_roles :
    [for policy_arn in role.policy_list : {
      role_name  = role.role_name
      policy_arn = policy_arn
    }]
  ])
} 