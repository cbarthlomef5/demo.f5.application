resource "aws_route_table" "internal-a-rt" {
  vpc_id = aws_vpc.security.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw1.id
  }

  tags = {
    Name = "internal-a-rt"
  }
}

resource "aws_route_table" "internal-b-rt" {
  vpc_id = aws_vpc.security.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw2.id
  }

  tags = {
    Name = "internal-b-rt"
  }
}

resource "aws_route_table_association" "internal-a-rt" {
  subnet_id      = aws_subnet.internal-a.id
  route_table_id = aws_route_table.internal-a-rt.id
}

resource "aws_route_table_association" "internal-b-rt" {
  subnet_id      = aws_subnet.internal-b.id
  route_table_id = aws_route_table.internal-b-rt.id
}