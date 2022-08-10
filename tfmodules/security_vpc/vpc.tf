resource "aws_vpc" "security" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "${var.vpc_name_tag}-vpc"
  }
}