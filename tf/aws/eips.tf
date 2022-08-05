resource "aws_eip" "windows_bastion" {
  network_interface = aws_network_interface.windows_bastion_public.id
  vpc      = true
  tags = {
    "Name" = "windows_bastion_eip"
  }
}

resource "aws_eip" "ngw" {
  vpc      = true
  tags = {
    "Name" = "ngw_eip"
  }
}
