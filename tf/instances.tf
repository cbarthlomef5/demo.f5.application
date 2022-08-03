resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.caleb.key_name

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
