resource "aws_instance" "bigip_terraform_server" {
  ami = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"
  key_name      = "demo"
  subnet_id = var.management_subnet

  tags = {
    Name = "bigip_terraform_server"
  } 

  user_data = file("../bash/bootstrapTerraform.sh")
}