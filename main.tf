module "webserver_deploy" {
  source = "./tfmodules/webservers"

  servers_vpc_id = local.servers_vpc_id
  aws_key_pair_name = var.aws_key_pair_name
  nginx_webserver_count = var.nginx_webserver_count
}

/*
module "cft_deploy" {
  source = "./tfmodules/cftDeploy"

  vpc_id = module.aws_infrastructure.vpc_id
  vpc_cidr = var.vpc_cidr
  aws_key_pair_name = var.aws_key_pair_name
  bigip_pw_arn = module.aws_infrastructure.bigip_pw_arn

  # Subnets
  management_a_subnet = module.aws_infrastructure.management_a_subnet
  management_b_subnet = module.aws_infrastructure.management_b_subnet
  external_a_subnet = module.aws_infrastructure.external_a_subnet
  external_b_subnet = module.aws_infrastructure.external_b_subnet
  internal_a_subnet = module.aws_infrastructure.internal_a_subnet
  internal_b_subnet = module.aws_infrastructure.internal_b_subnet
}
/*
module "bigip_setup" {
    source = "./tfmodules/bigip"

    depends_on = [
      module.cft_deploy
    ]
}
*/