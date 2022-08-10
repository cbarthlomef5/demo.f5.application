module "aws_infrastructure" {
    source = "./modules/aws"
}

module "bigip_setup" {
    source = "./modules/bigip"

    management_subnet = module.aws_infrastructure.management_subnet_a_id
    external_subnet = module.aws_infrastructure.external_subnet_a_id
    bigip_a_mgmt_ip = module.aws_infrastructure.bigip_a_mgmt_ip
    webserver_pool_nodes = module.aws_infrastructure.webserver_pool_nodes
    bigip_pw_arn = module.aws_infrastructure.bigip_pw_arn
    aws_key_pair_name = module.aws_infrastructure.aws_key_pair_name

    depends_on = [
      module.aws_infrastructure
    ]
}