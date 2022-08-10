resource "aws_instance" "webserver-aza" {
  count = var.webserver_count
  ami = var.aws_ec2_ami
  instance_type = var.aws_instance_size
  key_name      = var.aws_key_pair_name
  subnet_id = aws_subnet.internal-a.id

  tags = {
    Name = "webserver-aza-${count.index+1}"
    App = "nginx_web_server"
    VPC = var.vpc_name_tag
  }

  user_data = file(var.webserver_bash_script)
}

resource "aws_instance" "webserver-azb" {
  count = var.webserver_count
  ami = var.aws_ec2_ami
  instance_type = var.aws_instance_size
  key_name      = var.aws_key_pair_name
  subnet_id = aws_subnet.internal-b.id

  tags = {
    Name = "webserver-azb-${count.index+1}"
    App = "nginx_web_server"
    VPC = var.vpc_name_tag
  }

  user_data = file(var.webserver_bash_script)
}