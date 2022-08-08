module "aws_infrastructure" {
    source = "./aws"
}

module "bipg_setup" {
    source = "./bigip"

    depends_on = [
      module.aws_infrastructure
    ]
}