resource "bigip_as3" "as3_deploy" {
  as3_json = data.template_file.as3_declaration_file.rendered
}