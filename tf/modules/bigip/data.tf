data "template_file" "as3_declaration_file" {
  template = file("./modules/bigip/as3_template.json")
  vars = {
    "webserver_pool_members" = tostring(local.bigip_env_json.webserver_pool_nodes)
  }
}