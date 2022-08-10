resource "aws_eip" "windows_bastion" {
  network_interface = aws_network_interface.windows_bastion.id
  vpc      = true
  tags = {
    "Name" = "windows_bastion_eip"
  }
}

resource "aws_eip" "terraform_host" {
  network_interface = aws_network_interface.terraform_host.id
  vpc      = true
  tags = {
    "Name" = "terraform_host_eip"
  }
}