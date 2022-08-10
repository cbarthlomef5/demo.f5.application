resource "aws_network_interface" "windows_bastion" {
  subnet_id   = var.external_subnet

  tags = {
    Name = "windows_bastion_network_interface"
  }
}