terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.bigip_a_mgmt_ip
  username = "admin"
  password = local.bigip_pw
}