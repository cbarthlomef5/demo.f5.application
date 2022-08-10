# Local variables

# Imported variables
variable "aws_key_pair_name" {
  type = string
}

variable "bigip_pw_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "management_a_subnet" {
  type = string
}

variable "management_b_subnet" {
  type = string
}

variable "external_a_subnet" {
  type = string
}

variable "external_b_subnet" {
  type = string
}

variable "internal_a_subnet" {
  type = string
}

variable "internal_b_subnet" {
  type = string
}