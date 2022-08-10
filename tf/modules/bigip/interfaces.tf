resource "aws_network_interface" "terraform_host" {
  subnet_id   = var.external_subnet

  tags = {
    Name = "terraform_host_network_interface"
  }
}