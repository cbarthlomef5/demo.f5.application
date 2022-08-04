resource "aws_eip" "ubuntu" {
  network_interface = "${aws_network_interface.ubuntu_public.id}"
  vpc      = true
}

resource "aws_eip" "ngw1" {
  vpc      = true
}

resource "aws_eip" "ngw2" {
  vpc      = true
}