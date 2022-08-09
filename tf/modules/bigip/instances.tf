resource "aws_instance" "terraform_host" {
  ami = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"
  key_name      = "demo"

  network_interface {
    network_interface_id = aws_network_interface.terraform_host_public.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.terraform_host_private.id
    device_index         = 1
  }

  tags = {
    Name = "terraform_host"
  } 

  user_data = file("../bash/bootstrapTerraform.sh")

  connection {
    host = self.public_ip
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/demo_id_rsa")
  }
  
  provisioner "file" {
    source = "./modules/bigip/as3"
    destination = "/home/ec2-user/tf"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/tf/terraform.sh",
      "/home/ec2-user/tf/terraform.sh"
    ]
  }
}