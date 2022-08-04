resource "aws_secretsmanager_secret" "bigip-password" {
  name = "mySecretId"
}

resource "aws_secretsmanager_secret_version" "bigip-password" {
  secret_id     = aws_secretsmanager_secret.bigip-password.id
  secret_string = "BIGIP#Passw0rd"
}