resource "aws_security_group" "bastion_host_sg" {
  name        = "BastionHost-SG"
  description = "Bastion-Host EC2 instance security rules"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
