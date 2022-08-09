locals {
  bigip_env_json = jsondecode(file("./modules/bigip/as3/bigip_json.json"))
}