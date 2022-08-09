output "cfe_failover_tag" {
  value = var.cfe_failover_tag
}

output "bigip_a_mgmt_ip" {
  value = data.aws_cloudformation_stack.bigip_a_mgmt_ip.outputs["bigIpInstanceMgmtPrivateIp01"]
}

output "secret_id_test" {
  value = data.aws_secretsmanager_secret.by_name.arn
}

output "secret_version_test" {
  value = local.bigip_pw
}