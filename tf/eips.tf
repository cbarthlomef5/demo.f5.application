resource "aws_eip" "ubuntu" {
  network_interface = "${aws_network_interface.ubuntu_public.id}"
  vpc      = true
}