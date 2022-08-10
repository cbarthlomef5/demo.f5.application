data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

data "aws_secretsmanager_secret" "home_ip_secret_id" {
  name = var.home_ip_secret_id
}

data "aws_secretsmanager_secret_version" "home_ip_secret_id_current_version" {
  secret_id = data.aws_secretsmanager_secret.home_ip_secret_id.id
}