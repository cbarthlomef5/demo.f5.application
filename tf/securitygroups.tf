resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.security.id

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
    cidr_blocks = [aws_vpc.security.cidr_block]
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