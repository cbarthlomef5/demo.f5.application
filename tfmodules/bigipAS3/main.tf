resource "local_file" "bigip_as3_declaration_create" {
  content = data.template_file.as3_declaration_file.rendered
  filename = "${path.module}/as3/as3_declaration.json"
}
