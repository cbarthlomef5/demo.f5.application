resource "aws_route_table" "security_vpc_ngw_rt" {
  vpc_id = aws_vpc.security.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "ngw-rt"
  }
}

resource "aws_route_table_association" "internal_a" {
  subnet_id      = aws_subnet.internal-a.id
  route_table_id = aws_route_table.security_vpc_ngw_rt.id
}

resource "aws_route_table_association" "internal_b" {
  subnet_id      = aws_subnet.internal-b.id
  route_table_id = aws_route_table.security_vpc_ngw_rt.id
}

resource "aws_route_table_association" "management_a" {
  subnet_id      = aws_subnet.management-a.id
  route_table_id = aws_route_table.security_vpc_ngw_rt.id
}

resource "aws_route_table_association" "management_b" {
  subnet_id      = aws_subnet.management-b.id
  route_table_id = aws_route_table.security_vpc_ngw_rt.id
}