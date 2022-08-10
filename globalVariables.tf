variable "webserver_count" {
  # Will deploy this number of instances PER AZ!!
  default = 2
}

resource "aws_secretsmanager_secret" "bigip-password" {
  name = "mySecretId"
}

resource "aws_secretsmanager_secret_version" "bigip-password" {
  secret_id     = aws_secretsmanager_secret.bigip-password.id
  secret_string = "admin.F5demo.com"
}

variable "aws_key_pair_name" {
  default = "demo"
}

variable "aws_key_pair_file_priv" {
  default = "~/.ssh/demo_id_rsa"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "bastion_host_vpc_cidr" {
  default = "10.5.0.0/16"
}