output "mod_aws_bigip_a_mgmt_ip" {
  value = module.aws_infrastructure.bigip_a_mgmt_ip
}

output "webserver_pool_nodes" {
  value = module.aws_infrastructure.webserver_pool_nodes
}