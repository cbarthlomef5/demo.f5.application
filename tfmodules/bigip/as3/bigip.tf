# Example Usage for json file
resource "bigip_as3" "as3_deploy" {
  as3_json = file("./as3_declaration.json")
}