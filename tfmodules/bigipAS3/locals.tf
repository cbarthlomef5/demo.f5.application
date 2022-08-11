locals {
  as3_declaration_file_template = jsonencode(file("${path.module}/as3//as3_template.json"))
}