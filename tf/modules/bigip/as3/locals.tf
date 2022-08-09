locals {
  bigip_pw = data.aws_secretsmanager_secret_version.bigip_pw_secret_current_version.secret_string
}