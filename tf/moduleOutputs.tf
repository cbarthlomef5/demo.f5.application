output "mod_aws_management_subnet_a_id" {
  value = module.aws_infrastructure.management_subnet_a_id
}

output "mod_aws_bigip_mgmip_a" {
  value = module.aws_infrastructure.bigip_mgmip_a
}

output "mod_aws_webserver_pool" {
  value = module.aws_infrastructure.webserver_pool
}