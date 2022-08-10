output "bigip_pw" {
  value = local.bigip_pw
  sensitive = true
}

output "bigip_pw_arn" {
  value = data.aws_secretsmanager_secret.bigip_pw_by_name.arn
}