resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.ngw1.id
  subnet_id     = aws_subnet.external-a.id

  tags = {
    Name = "internal-a-ngw"
  }

}

resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.ngw2.id
  subnet_id     = aws_subnet.external-b.id

  tags = {
    Name = "internal-b-ngw"
  }

}