resource "aws_eip" "ubuntu" {
  instance = aws_instance.ubuntu.id
  vpc      = true
}