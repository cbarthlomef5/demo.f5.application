locals {
  home_ip = data.aws_secretsmanager_secret_version.home_ip_secret_id_current_version.secret_string
}