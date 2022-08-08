module "aws_infrastructure" {
    source = "./modules/aws"
}

module "bipg_setup" {
    source = "./modules/bigip"

    management_subnet = module.aws_infrastructure.management_subnet_a_id
    bigip_mgmt_ip = module.aws_infrastructure.bigip_mgmip_a
    bigip_webserver_pool = module.aws_infrastructure.webserver_pool

    depends_on = [
      module.aws_infrastructure
    ]
}