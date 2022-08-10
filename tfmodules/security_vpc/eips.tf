resource "aws_eip" "ngw" {
  vpc_id = aws_vpc.vpc.id
  vpc      = true
  tags = {
    "Name" = "${var.vpc_name_tag}_ngw_eip"
  }
}