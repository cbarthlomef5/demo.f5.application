# Local variables
variable "vpc_name_tag" {
  default = "security"
}
variable "aws_instance_size" {
  default = "t2.micro"
}

variable "aws_ec2_ami" {
  default = "ami-0cea098ed2ac54925"
}

variable "webserver_bash_script" {
  default = "./scripts/bash/bootstrapWebserver.sh"
}

# Imported variables
variable "webserver_count" {
}

variable "aws_key_pair_name" {
  type = string
}

variable "bastion_host_vpc_cidr" {
  type = string
}

variable "bigip_pw_secret_id" {
  type = string
}

variable "bigip_pw_secret_pw" {
  type = string
}

variable "home_ip_secret_id" {
  type = string
}