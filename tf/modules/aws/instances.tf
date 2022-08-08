resource "aws_instance" "windows_bastion" {
  ami = var.windows_bastion_ami
  instance_type = var.aws_instance_size
  key_name      = aws_key_pair.demo.key_name
  get_password_data = true

  network_interface {
    network_interface_id = aws_network_interface.windows_bastion_public.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.windows_bastion_private.id
    device_index         = 1
  }

  tags = {
    Name = "windows_bastion_host"
  } 

  user_data = data.template_file.windows_bastion_user_data.rendered
}

resource "aws_instance" "webserver-aza" {
  count = var.webserver_count
  ami = var.aws_ec2_ami
  instance_type = var.aws_instance_size
  key_name      = aws_key_pair.demo.key_name
  subnet_id = aws_subnet.internal-a.id

  tags = {
    Name = "webserver-aza-${count.index+1}"
    app = "nginx_web_server"
  }

  user_data = file("../bash/bootstrapWebserver.sh")
}

resource "aws_instance" "webserver-azb" {
  count = var.webserver_count
  ami = var.aws_ec2_ami
  instance_type = var.aws_instance_size
  key_name      = aws_key_pair.demo.key_name
  subnet_id = aws_subnet.internal-b.id

  tags = {
    Name = "webserver-azb-${count.index+1}"
    app = "nginx_web_server"
  }

  user_data = "${file("../bash/bootstrapWebserver.sh")}"
}