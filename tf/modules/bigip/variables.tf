variable "external_subnet" {
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

variable "floating_eip" {
}