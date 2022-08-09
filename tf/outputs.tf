output "bigip_a_mgmt_ip" {
  value = module.aws_infrastructure.bigip_mgmip_a
}

output "webserver_pool_node_list" {
  value = module.aws_infrastructure.webserver_pool
}

output "main_bigip_objects_json" {
  value = module.aws_infrastructure.bigip_objects_json
}