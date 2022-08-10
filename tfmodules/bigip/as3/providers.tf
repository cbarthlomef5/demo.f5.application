terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = data.aws_cloudformation_stack.bigip_a_mgmt_ip.outputs["bigIpInstanceMgmtPrivateIp01"]
  username = "admin"
  password = local.bigip_pw
}