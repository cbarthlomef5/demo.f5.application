variable "aws_key_pair_name" {
  default = "demo"
}

variable "aws_key_pair_file" {
  default = {
    public = "~/.ssh/demo_id_rsa.pub"
    private = "~/.ssh/demo_id_rsa"
  }
}

variable "aws_instance_size" {
  default = "t2.micro"
}

variable "aws_ec2_ami" {
  default = "ami-0cea098ed2ac54925"
}

variable "webserver_count" {
  default = 1
}