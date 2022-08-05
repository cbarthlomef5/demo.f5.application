resource "aws_eip" "windows_bastion" {
  network_interface = aws_network_interface.windows_bastion_public.id
  vpc      = true
}

resource "aws_eip" "ngw1" {
  vpc      = true
}

resource "aws_eip" "ngw2" {
  vpc      = true
}
