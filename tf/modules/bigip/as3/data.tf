data "aws_cloudformation_stack" "bigip_a_mgmt_ip" {
  name = "networking-stack"
}

# data.aws_cloudformation_stack.bigip_a_mgmt_ip.outputs["bigIpInstanceMgmtPrivateIp01"]

data "aws_secretsmanager_secret" "by_arn" {
  arn = var.bigip_pw_arn
}

data "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = data.aws_secretsmanager_secret.by_name.id
}