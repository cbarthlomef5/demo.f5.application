resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.udf.key_name
  security_groups = aws_security_group.ubuntu_bastion_host.id

  network_interface {
    network_interface_id = aws_network_interface.ubuntu_public.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.ubuntu_private.id
    device_index         = 1
  }

  tags = {
    Name = "ubuntu_bastion_host"
  }
}
