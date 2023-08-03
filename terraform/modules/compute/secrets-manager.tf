data "aws_secretsmanager_secret" "manager" {
  name = var.key_pair_name
}

data "aws_secretsmanager_secret_version" "secret_current_version" {
  secret_id     = data.aws_secretsmanager_secret.manager.id
  version_stage = "AWSCURRENT"
}

resource "local_file" "ssh_secret" {
    content  = data.aws_secretsmanager_secret_version.secret_current_version.secret_string
    filename = "private-key/${var.key_pair_name}.pem"
}