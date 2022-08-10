resource "aws_instance" "windows_bastion" {
  ami = var.windows_bastion_ami
  instance_type = "t2.medium"
  key_name      = var.aws_key_pair_name

  tags = {
    Name = "windows_bastion_host"
  } 

  network_interface {
    network_interface_id = aws_network_interface.windows_bastion.id
    device_index = 0
  }

  user_data = data.template_file.windows_bastion_user_data.rendered
}