resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.external-a.id

  tags = {
    Name = "external-a-ngw"
  }

}