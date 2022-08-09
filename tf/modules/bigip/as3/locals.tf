locals {
  bigip_env_json = jsondecode(file("./bigip_json.json"))
}