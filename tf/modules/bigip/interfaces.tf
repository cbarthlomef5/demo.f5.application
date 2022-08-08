resource "aws_network_interface" "terraform_host_public" {
  subnet_id   = var.external_subnet

  tags = {
    Name = "terraform_host_public_network_interface"
  }
}

resource "aws_network_interface" "terraform_host_private" {
  subnet_id   = var.management_subnet

  tags = {
    Name = "terraform_host_private_network_interface"
  }
}
