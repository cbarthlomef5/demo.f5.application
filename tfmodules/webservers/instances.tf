resource "aws_instance" "nginx_web_server" {
  count = var.nginx_webserver_count
  ami = var.nginx_ami
  instance_type = var.aws_instance_size
  key_name      = var.aws_key_pair_name
  subnet_id = data.aws_subnet.servers_vpc_sub_id[0].id

  tags = {
    "Name" = "nginx_webserver${count.index+1}"
    "ServerType" = "nginx"
  }

  user_data = file("${path.module}/scripts/bash/bootstrapWebserver.sh")
}