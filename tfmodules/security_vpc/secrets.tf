resource "aws_secretsmanager_secret" "bigip_pw_secret_id" {
  name = var.bigip_pw_secret_id
}

resource "aws_secretsmanager_secret_version" "bigip_pw_secret_id" {
  secret_id     = aws_secretsmanager_secret.bigip_pw_secret_id.id
  secret_string = var.bigip_pw_secret_pw
}