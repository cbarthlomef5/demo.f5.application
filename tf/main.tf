module "aws_infrastructure" {
    source = "./modules/aws"
}

module "bipg_setup" {
    source = "./modules/bigip"

    management_subnet = module.aws_infrastructure.management_subnet_a_id
    external_subnet = module.aws_infrastructure.external_subnet_a_id
    bigip_a_mgmt_ip = module.aws_infrastructure.bigip_a_mgmt_ip
    webserver_pool_nodes = module.aws_infrastructure.webserver_pool_nodes
}