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

  user_data = "${file("../bash/ubuntuBastion.sh")}"

  connection {
    type = "ssh"
    user = "ubuntu"
    password = ""
    private_key = file(lookup(var.aws_key_pair_file, "private"))
    host = self.public_ip
  }

  provisioner "file" {
    source = "~/.ssh/demo_id_rsa"
    destination = "/home/ubuntu/.ssh/id_rsa"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/ubuntu/.ssh/id_rsa"
    ]
  }
}

resource "aws_instance" "ec2_bastion" {
  ami = lookup(var.aws_nginx_props, "ami")
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name

  network_interface {
    network_interface_id = aws_network_interface.ec2_bastion_public.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.ec2_bastion_private.id
    device_index         = 1
  }

  tags = {
    Name = "ec2_bastion_host"
  }

  user_data = "${file("../bash/ec2Bastion.sh")}"

  connection {
    type = "ssh"
    user = "ec2-user"
    password = ""
    private_key = file(lookup(var.aws_key_pair_file, "private"))
    host = self.public_ip
  }

  provisioner "file" {
    source = "~/.ssh/demo_id_rsa"
    destination = "/home/ec2-user/.ssh/id_rsa"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/ec2-user/.ssh/id_rsa"
    ]
  }
}

resource "aws_instance" "webserver-aza" {
  count = var.webserver_count
  ami = lookup(var.aws_nginx_props, "ami")
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name
  subnet_id = aws_subnet.internal-a.id

  tags = {
    Name = "webserver-aza-${count.index+1}"
  }

  user_data = "${file("../bash/bootstrapWebserver.sh")}"
}

resource "aws_instance" "webserver-azb" {
  count = var.webserver_count
  ami = lookup(var.aws_nginx_props, "ami")
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name
  subnet_id = aws_subnet.internal-b.id

  tags = {
    Name = "webserver-azb-${count.index+1}"
  }

  user_data = "${file("../bash/bootstrapWebserver.sh")}"
}