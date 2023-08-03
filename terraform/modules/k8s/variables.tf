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

# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string  
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# variable "cluster_public_nodegroups" {
#     description = "value"
#     type = list(object)
# }

# variable "cluster_private_nodegroups" {
#     description = "value"
#     type = list(object)
# }

variable "eks_control_role" {
    description = "IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf"
    type = string
}

variable "nodegroup_role" {
    description = "Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group"
    type = string
}

variable "vpc_name" {
    description = "Cluster VPC Name"
    type = string
}

variable "vpc_public_subnets" {
    description = "VPC Public Subnets"
    type = list(string)
}

variable "vpc_private_subnets" {
    description = "VPC Private Subnets"
    type = list(string)
}

variable "eks_nodegroup_list" {
    description = "Cluster NodeGroups"
    type = list(object({
      name = string
      is_private = bool
      ami_type = string
      capacity_type = string
      disk_size = number
      instance_types = list(string)
      remote_access = object({
        ec2_ssh_key = string
      })
      scaling = object({
        expected = number
        min = number
        max = number
      })
      update_config = object({
        max_unavailable = number
      })
    }))
}
