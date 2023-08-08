locals {
  parm_values = data.aws_ssm_parameters_by_path.eks_with_tf_store.names
} 