data "aws_cloudformation_stack" "bigip_a_mgmt_ip" {
  name = "networking-stack"
}

# data.aws_cloudformation_stack.bigip_a_mgmt_ip.outputs["bigIpInstanceMgmtPrivateIp01"]

data "aws_secretsmanager_secret" "bigip_pw_by_name" {
  name = "mySecretId"
}

data "aws_secretsmanager_secret_version" "bigip_pw_secret_current_version" {
  secret_id = data.aws_secretsmanager_secret.bigip_pw_by_name.id
}