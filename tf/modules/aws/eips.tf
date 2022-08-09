resource "aws_eip" "ngw" {
  vpc      = true
  tags = {
    "Name" = "ngw_eip"
  }
}
