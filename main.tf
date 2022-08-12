module "webserver_deploy" {
  source = "./tfmodules/webservers"

  servers_vpc_id = local.servers_vpc_id
  aws_key_pair_name = var.aws_key_pair_name
  nginx_webserver_count = var.nginx_webserver_count
}

module "bigip_setup" {
  source = "./tfmodules/bigipAS3"

  aws_key_pair_name = var.aws_key_pair_name
  webserver_pool_nodes = module.webserver_deploy.webserver_pool_nodes
}
