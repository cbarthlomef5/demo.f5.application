locals {
  as3_declaration_file_template = jsonencode(file("./modules/bigip/as3_template.json"))
  bigip_pw = data.aws_secretsmanager_secret_version.bigip_pw_secret_current_version.secret_string
}