# Example Usage for json file
resource "bigip_as3" "as3-example1" {
  as3_json = file("./as3_declaration.json")
}