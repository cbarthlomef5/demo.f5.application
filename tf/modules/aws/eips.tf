resource "aws_eip" "ngw" {
  vpc      = true
  tags = {
    "Name" = "ngw_eip"
  }
}

resource "aws_eip" "floating_eip" {
  vpc      = true
  tags = {
    "Name" = "floating_eip"
  }
}