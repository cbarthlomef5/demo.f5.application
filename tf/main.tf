module "aws_infrastructure" {
    source = "./modules/aws"
}

module "bipg_setup" {
    source = "./modules/bigip"

    management_subnet = mod_aws_management_subnet_a_id
    bigip_mgmt_ip = mod_aws_bigip_mgmip_a
    bigip_webserver_pool = mod_aws_webserver_pool

    depends_on = [
      module.aws_infrastructure
    ]
}