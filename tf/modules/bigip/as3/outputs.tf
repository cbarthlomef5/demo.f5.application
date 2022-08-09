output "cfe_failover_tag" {
  value = var.cfe_failover_tag
}

output "bigip_a_mgmt_ip" {
  value = data.aws_cloudformation_stack.bigip_a_mgmt_ip.outputs["bigIpInstanceMgmtPrivateIp01"]
}

output "secret_id_arn" {
  value = data.aws_secretsmanager_secret.bigip_pw_by_name.arn
}

output "bigip_pw_output" {
  value = data.aws_secretsmanager_secret_version.bigip_pw_secret_current_version.secret_string
  sensitive = true
}