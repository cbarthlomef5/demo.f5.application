data "template_file" "as3_declaration_file" {
  template = file("${path.module}/as3/as3_template.json")
  vars = {
    "webserver_pool_members" = jsonencode(var.webserver_pool_nodes)
  }
}