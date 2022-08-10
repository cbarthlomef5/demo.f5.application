output "webserver_pool_nodes" {
  value = concat(aws_instance.webserver-aza[*].private_ip, aws_instance.webserver-azb[*].private_ip)
}

output "bigip_pw_arn" {
  value = aws_secretsmanager_secret.bigip_pw_secret_id.arn
}