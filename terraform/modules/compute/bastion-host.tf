# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
resource "aws_instance" "bastion_host" {

  # insert the required variables here
  # name                   = "${var.instance_name}-BastionHost"
  ami             = data.aws_ami.azl2.id
  instance_type   = var.instance_type
  key_name        = var.key_pair_name
  subnet_id       = data.aws_subnet.subnet.id
  security_groups = [aws_security_group.bastion_host_sg.id]
  tags = {
    "Name" = "${var.instance_name}-BastionHost"
  }
  depends_on = [
    aws_security_group.bastion_host_sg
  ]
}