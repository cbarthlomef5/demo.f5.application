module "aws_infrastructure" {
    source = "./modules/aws"
}

module "bipg_setup" {
    source = "./modules/bigip"

    management_subnet = module.aws_infrastructure.management_subnet_a_id
    external_subnet = module.aws_infrastructure.external_subnet_a_id

    depends_on = [
      module.aws_infrastructure
    ]
}