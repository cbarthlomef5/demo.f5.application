variable "aws_key_pair_name" {
  default = "udf"
}

variable "aws_key_pair_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "aws_nginx_props" {
  ami = "ami-0cea098ed2ac54925"
  itype = "t2.micro"
}