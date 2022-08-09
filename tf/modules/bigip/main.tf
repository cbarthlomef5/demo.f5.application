resource "local_file" "bigip_json" {
  content = data.template_file.as3_declaration_file.rendered
  filename = "./modules/bigip/as3/as3_declaration.json"
}