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