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

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir /var/www/apps"
    ]
  }

  provisioner "file" {
    source = "${path.module}/apps/webpages/"
    destination = "/var/www/apps"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl restart nginx"
    ]
  }
}