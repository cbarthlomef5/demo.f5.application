output "management_subnet_a_id" {
  value = aws_subnet.management-a.id
}

output "external_subnet_a_id" {
  value = aws_subnet.external-a.id
}

output "bigip_a_mgmt_ip" {
  value = aws_cloudformation_stack.network.parameters.bigIpMgmtAddress01
}

output "webserver_pool_nodes" {
  value = concat(aws_instance.webserver-aza[*].private_ip, aws_instance.webserver-azb[*].private_ip)
}

output "bigip_pw_arn" {
  value = aws_secretsmanager_secret.bigip-password.arn
}