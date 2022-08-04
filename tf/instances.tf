resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = lookup(var.aws_nginx_props, "itype")
  key_name      = aws_key_pair.demo.key_name

  user_data = <<EOF
    #!/bin/bash

    echo "Updating and cleaning system"
    sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean

    echo "Creating demo user"
    sudo useradd -m -s /bin/bash demo
    echo "demo:demo.F5.com" | sudo chpasswd

    echo "Installing RDP client and GUI"
    sudo apt install xrdp -y
    sudo apt install xfce4 -y
    sudo apt install xfce4-terminal -y

    echo "Setting RDP params"
    sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

    echo "Updating local firewall for RDP"
    sudo ufw allow 3389/tcp

    echo "Restarting RDP service"
    sudo /etc/init.d/xrdp restart
  EOF

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