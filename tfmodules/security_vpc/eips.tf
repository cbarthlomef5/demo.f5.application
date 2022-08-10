resource "aws_eip" "ngw" {
  vpc      = true
  tags = {
    "Name" = "${var.vpc_name_tag}_ngw_eip"
  }
}