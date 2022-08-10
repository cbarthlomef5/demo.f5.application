module "aws_infrastructure" {
    source = "./modules/aws"
}

module "bigip_setup" {
    source = "./modules/bigip"

    external_subnet = module.aws_infrastructure.external_subnet_a_id
    webserver_pool_nodes = module.aws_infrastructure.webserver_pool_nodes
    bigip_pw_arn = module.aws_infrastructure.bigip_pw_arn
    aws_key_pair_name = module.aws_infrastructure.aws_key_pair_name
    floating_eip = module.aws_infrastructure.floating_eip

    depends_on = [
      module.aws_infrastructure
    ]
}

module "bastion_host_setup" {
  source = "./modules/bastion"

  aws_key_pair_name = module.aws_infrastructure.aws_key_pair_name
  floating_eip = module.aws_infrastructure.floating_eip
  external_subnet = module.aws_infrastructure.external_subnet_a_id

  depends_on = [
    module.bigip_setup
  ]  
}