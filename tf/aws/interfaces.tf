resource "aws_network_interface" "ubuntu_public" {
  subnet_id   = aws_subnet.external-a.id
  private_ips = [cidrhost(aws_subnet.external-a.cidr_block, 4)]

  tags = {
    Name = "ubuntu_public_network_interface"
  }
}

resource "aws_network_interface" "ubuntu_private" {
  subnet_id   = aws_subnet.management-a.id
  private_ips = [cidrhost(aws_subnet.management-a.cidr_block, 4)]

  tags = {
    Name = "ubuntu_private_network_interface"
  }
}

resource "aws_network_interface" "ec2_bastion_public" {
  subnet_id   = aws_subnet.external-a.id
  private_ips = [cidrhost(aws_subnet.external-a.cidr_block, 5)]

  tags = {
    Name = "ec2_bastion_public_network_interface"
  }
}

resource "aws_network_interface" "ec2_bastion_private" {
  subnet_id   = aws_subnet.management-a.id
  private_ips = [cidrhost(aws_subnet.management-a.cidr_block, 5)]

  tags = {
    Name = "ec2_bastion_private_network_interface"
  }
}
