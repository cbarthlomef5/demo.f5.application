resource "aws_instance" "bigip_terraform_server" {
  ami = "ami-0cea098ed2ac54925"
  instance_type = "t2.micro"
  key_name      = "demo"
  subnet_id = module.mod_aws_management_subnet_a_id

  tags = {
    Name = "bigip_terraform_server"
  } 

  #user_data = data.template_file.windows_bastion_user_data.rendered
}