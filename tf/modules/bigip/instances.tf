resource "aws_instance" "windows_bastion" {
  ami = var.windows_bastion_ami
  instance_type = "t2.medium"
  key_name      = var.aws_key_pair_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "windows_bastion_host"
  } 

  user_data = data.template_file.windows_bastion_user_data.rendered

  network_interface {
    network_interface_id = aws_network_interface.windows_bastion.id
    device_index = 0
  }

  connection {
    host = self.public_ip
    type = "ssh"
    user = "demo"
    private_key = file("~/.ssh/demo_id_rsa")
    target_platform = "windows"
    timeout = "6m"
  }
  provisioner "file" {
    source = "./modules/bigip/as3"
    destination = "C:\temp\tf"
  }
/*
  provisioner "remote-exec" {
    inline = [
      "chmod +x C:\temp\tf\terraform.sh",
      "C:\temp\tf\terraform.sh"
    ]
  }*/
}


resource "aws_instance" "terraform_host" {
  ami = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"
  key_name      = var.aws_key_pair_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "terraform_host"
  } 

  user_data = file("../bash/bootstrapTerraform.sh")

  network_interface {
    network_interface_id = aws_network_interface.terraform_host.id
    device_index = 0
  }

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

resource "aws_iam_policy" "ec2_policy" {
  name_prefix = "terraform_host_iam_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:Get*",
          "secretsmanager:Describe*",
          "cloudformation:Get*",
          "cloudformation:Describe*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "ec2_role" {
  name_prefix = "terraform_host_iam_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name = "terraform_host_iam_attachment"
  roles = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name_prefix = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}