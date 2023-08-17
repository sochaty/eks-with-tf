variable "aws_region" {
  description = "Region Name"
  type        = string
  # default     = "us-east-1"
}

variable "namespace" {
  description = "The namespace to deploy MediaWiki"
  # default     = "mediawiki"
}

variable "storage_class_name" {
  description = "The name of the storage class for PVCs"
  # default     = "standard"
}