module "aws_infrastructure" {
    source = "./tfmodules/security_vpc"

    webserver_count = var.webserver_count    
    aws_key_pair_name = var.aws_key_pair_name
    bastion_host_vpc_cidr = var.bastion_host_vpc_cidr
}
/*
module "cft_deploy" {
  source = "./tfmodules/cftDeploy"
}

module "bigip_setup" {
    source = "./tfmodules/bigip"

    depends_on = [
      module.cft_deploy
    ]
}
*/