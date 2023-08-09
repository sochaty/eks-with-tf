# Create a Null Resource and Provisioners
resource "null_resource" "copy_bastion_host_keys" {
  depends_on = [aws_instance.bastion_host, local_file.ssh_secret]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = var.instance_user
    password    = ""
    private_key = file("private-key/${var.key_pair_name}.pem")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/${var.key_pair_name}.pem"
    destination = "/tmp/${var.key_pair_name}.pem"
  }
  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/${var.key_pair_name}.pem"
    ]
  }

}