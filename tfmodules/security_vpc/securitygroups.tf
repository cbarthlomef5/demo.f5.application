resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "All inbound from VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    self = true
  }

  ingress {
    description = "All inbound from VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  ingress {
    description = "All inbound from Bastion Host VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.bastion_host_vpc_cidr]
  }

  ingress {
    description = "All inbound from My IP"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${data.external.myipaddr.result.ip}/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}