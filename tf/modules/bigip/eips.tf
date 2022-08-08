resource "aws_eip" "terraform_host" {
  network_interface = aws_network_interface.terraform_host_public.id
  vpc      = true
  tags = {
    "Name" = "terraform_host_eip"
  }
}