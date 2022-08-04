resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name

  network_interface {
    network_interface_id = aws_network_interface.ubuntu_public.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.ubuntu_private.id
    device_index         = 1
  }

  tags = {
    Name = "ubuntu_bastion_host"
  }

  user_data = "${file("../ubuntu/bastion.sh")}"

  connection {
    type = "ssh"
    user = "ubuntu"
    password = ""
    private_key = lookup(var.aws_key_pair_file, "private")
    host = self.public_ip
  }

  provisioner "file" {
    source = "~/.ssh/demo_id_rsa"
    destination = "/home/ubuntu/.ssh/id_rsa"
  }
}

resource "aws_instance" "webserver01" {
  ami = lookup(var.aws_nginx_props, "ami")
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name

  network_interface {
    network_interface_id = aws_network_interface.webserver01.id
    device_index         = 0
  }

  tags = {
    Name = "webserver01"
  }

  user_data = <<EOF
    #!/bin/bash

    echo "Updating and cleaning system"
    EOF
}

resource "aws_instance" "webserver02" {
  ami = lookup(var.aws_nginx_props, "ami")
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name

  network_interface {
    network_interface_id = aws_network_interface.webserver02.id
    device_index         = 0
  }

  tags = {
    Name = "webserver02"
  }
}