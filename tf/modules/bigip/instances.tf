resource "aws_instance" "terraform_host" {
  ami = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"
  key_name      = "demo"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

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