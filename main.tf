module "webserver_deploy" {
  source = "./tfmodules/webservers"

  servers_vpc_id = local.servers_vpc_id
  aws_key_pair_name = var.aws_key_pair_name
  nginx_webserver_count = var.nginx_webserver_count
}


module "cft_deploy" {
  source = "./tfmodules/cftDeploy"

  aws_key_pair_name = var.aws_key_pair_name
  bigip_admin_pw = data.aws_secretsmanager_secret.bigip_pw_secret
}
/*
module "bigip_setup" {
    source = "./tfmodules/bigip"

    bigip_admin_pw = data.aws_secretsmanager_secret.bigip_pw_secret

    depends_on = [
      module.cft_deploy
    ]
}
*/