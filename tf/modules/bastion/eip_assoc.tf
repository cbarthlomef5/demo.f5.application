resource "aws_eip_association" "eip_assoc" {
  network_interface_id = aws_network_interface.windows_bastion.id
  allocation_id = var.floating_eip
  allow_reassociation = true
}