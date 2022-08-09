locals {
  as3_declaration_file_template = jsonencode(file("./modules/bigip/as3_template.json"))
}