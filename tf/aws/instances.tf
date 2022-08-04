resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.aws_instance_size
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

  user_data = "${file("../ps/windowsBastion.ps1")}"

  connection {
    type = "ssh"
    user = "windowsdemo"
    password = "Wind0wsS3rverSecure!"
    private_key = file(lookup(var.aws_key_pair_file, "private"))
    host = self.public_ip
    target_platform	= "windows"
    script_path = "c:/windows/temp/terraform_%RAND%.ps1"
  } 

  provisioner "remote-exec" {
    inline = [
      "mkdir C:/Users/windowsdemo/.ssh"
    ]
  }

  provisioner "file" {
    source = "~/.ssh/demo_id_rsa"
    destination = "C:/Users/windowsdemo/.ssh/id_rsa"
  }
}

resource "aws_instance" "webserver-aza" {
  count = var.webserver_count
  ami = var.aws_ec2_ami
  instance_type = var.aws_instance_size
  key_name      = aws_key_pair.demo.key_name
  subnet_id = aws_subnet.internal-a.id

  tags = {
    Name = "webserver-aza-${count.index+1}"
  }

  user_data = "${file("../bash/bootstrapWebserver.sh")}"
}

resource "aws_instance" "webserver-azb" {
  count = var.webserver_count
  ami = var.aws_ec2_ami
  instance_type = var.aws_instance_size
  key_name      = aws_key_pair.demo.key_name
  subnet_id = aws_subnet.internal-b.id

  tags = {
    Name = "webserver-azb-${count.index+1}"
  }

  user_data = "${file("../bash/bootstrapWebserver.sh")}"
}