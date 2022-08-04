resource "aws_network_interface" "ubuntu_public" {
  subnet_id   = aws_subnet.external-a.id
  private_ips = [cidrhost(aws_subnet.external-a.cidr_block, 4)]
  #security_groups = [aws_security_group.ubuntu_bastion_host-sg.id]

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

resource "aws_network_interface" "webserver01" {
  subnet_id   = aws_subnet.internal-a.id
  private_ips = [cidrhost(aws_subnet.internal-a.cidr_block, 4)]

  tags = {
    Name = "webserver01_network_interface"
  }
}

resource "aws_network_interface" "webserver02" {
  subnet_id   = aws_subnet.internal-b.id
  private_ips = [cidrhost(aws_subnet.internal-b.cidr_block, 4)]

  tags = {
    Name = "webserver02_network_interface"
  }
}