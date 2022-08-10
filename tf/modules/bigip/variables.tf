variable "management_subnet" {
  type = string
}

variable "external_subnet" {
  type = string
}

variable "bigip_a_mgmt_ip" {
  type = string
}

variable "webserver_pool_nodes" {
  type = list
}

variable "bigip_pw_arn" { 
}

variable "aws_key_pair_name" {
  type = string
}

variable "windows_bastion_ami" {
  default = "ami-01f14dc60171d8d7b"
}

variable "windows_demo_password" {
  default = "Wind0wsS3rverSecure!"
}