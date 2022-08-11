data "aws_vpcs" "bastion_host_vpc" {
  tags = {
    "VPC" = "bastion_host"
  }
}

data "aws_vpcs" "security_vpc" {
  tags = {
    "VPC" = "security"
  }
}

data "aws_vpcs" "servers_vpc" {
  tags = {
    "VPC" = "servers"
  }
}

data "aws_vpcs" "workstations_vpc" {
  tags = {
    "VPC" = "workstations"
  }
}

data "aws_secretsmanager_secret" "bigip_pw_secret_name" {
  name = var.bigip_pw_secret_name
}

data "aws_secretsmanager_secret_version" "bigip_pw_secret_current_version" {
  secret_id = data.aws_secretsmanager_secret.bigip_pw_secret_name.arn
}