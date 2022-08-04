variable "aws_key_pair_name" {
  default = "demo"
}

variable "aws_key_pair_file" {
  default = {
    public = "~/.ssh/demo_id_rsa.pub"
    private = "~/.ssh/demo_id_rsa"
  }
}

variable "aws_nginx_props" {
  default = {
    ami = "ami-0cea098ed2ac54925"
    itype = "t2.micro"
  }
}

variable "webserver_count" {
  default = 1
}