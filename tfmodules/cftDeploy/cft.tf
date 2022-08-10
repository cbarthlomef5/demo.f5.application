resource "random_string" "unique_id" {
  length = 16
  special = false
  upper = false
  keepers = {
    "aws_key_pair_name" = var.aws_key_pair_name
  }
}

data "http" "f5-cftv2-failover-existing-network" {
  url = "https://raw.githubusercontent.com/F5Networks/f5-aws-cloudformation-v2/main/examples/failover/failover-existing-network.yaml"
}

resource "aws_cloudformation_stack" "network" {
  name         = "networking-stack"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM"]
  disable_rollback = "false"
  parameters = {
    uniqueString             = "f5demo"
    vpcId                    = var.vpc_id
    vpcCidr                  = var.vpc_cidr
    bigIpMgmtSubnetId01      = var.management_a_subnet
    bigIpMgmtSubnetId02      = var.management_b_subnet
    bigIpExternalSubnetId01  = var.external_a_subnet
    bigIpExternalSubnetId02  = var.external_b_subnet
    bigIpInternalSubnetId01  = var.internal_a_subnet
    bigIpInternalSubnetId02  = var.internal_b_subnet
    bigIpMgmtAddress01       = "10.1.1.11"
    bigIpMgmtAddress02       = "10.1.2.11"
    bigIpExternalSelfIp01    = "10.1.3.11"
    bigIpExternalSelfIp02    = "10.1.4.11"
    bigIpInternalSelfIp01    = "10.1.5.11"
    bigIpInternalSelfIp02    = "10.1.6.11"
    bigIpExternalVip01       = "10.1.3.110"
    bigIpExternalVip02       = "10.1.4.110"
    bigIpPeerAddr            = "10.1.1.11"
    cfeVipTag                = "10.1.3.110,10.1.4.110"
    restrictedSrcAddressMgmt = "10.0.0.0/8"
    restrictedSrcAddressApp  = "0.0.0.0/0"
    provisionPublicIpMgmt    = "false"
    provisionPublicIpVip     = "true"
    secretArn                = var.bigip_pw_arn
    sshKey                   = var.aws_key_pair_name
    cfeTag                   = "bigip_high_availability_solution"
    cfeS3Bucket              = "f5demo-${random_string.unique_id.id}-bigip-high-availability-solution"
  }

  template_body = data.http.f5-cftv2-failover-existing-network.response_body
}
