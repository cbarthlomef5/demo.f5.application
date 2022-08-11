# webservers Module
# Local variables
variable "nginx_ami" {
  default = "ami-0cea098ed2ac54925"
}

variable "aws_instance_size" {
  default = "t2.micro"
}

# Imported variables
variable "servers_vpc_id" {
  type = string
}

variable "aws_key_pair_name" {
  type = string
}

variable "nginx_webserver_count" {
  
}