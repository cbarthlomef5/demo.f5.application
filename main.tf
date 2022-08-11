module "webserver_deploy" {
  source = "./tfmodules/webservers"

  servers_vpc_id = local.servers_vpc_id
  aws_key_pair_name = var.aws_key_pair_name
  nginx_webserver_count = var.nginx_webserver_count
}


module "cft_deploy" {
  source = "./tfmodules/cftDeploy"

  aws_key_pair_name = var.aws_key_pair_name
  bigip_pw_arn = data.aws_secretsmanager_secret.bigip_pw_name.arn
}

module "bigip_setup" {
  source = "./tfmodules/bigip"

  aws_key_pair_name = var.aws_key_pair_name
  bigip_pw_arn = data.aws_secretsmanager_secret.bigip_pw_name.arn
  bigip_a_mgmt_ip = module.cft_deploy.bigip_a_mgmt_ip
  webserver_pool_nodes = module.webserver_deploy.webserver_pool_nodes

}