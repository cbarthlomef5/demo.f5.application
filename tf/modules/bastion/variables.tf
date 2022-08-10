variable "windows_bastion_ami" {
  default = "ami-01f14dc60171d8d7b"
}

variable "windows_demo_password" {
  default = "Wind0wsS3rverSecure!"
}

variable "aws_key_pair_name" {
  type = string
}

variable "floating_eip" {
  type = string
}

variable "external_subnet" {
  type = string
}