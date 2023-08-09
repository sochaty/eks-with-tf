output "parm_values" {
  value = local.parm_values
}

output "values" {
  value = {
    for n, p in data.aws_ssm_parameter.tf_parameter : n => p.value
  }
}