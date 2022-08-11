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

resource "aws_cloudformation_stack" "bigip_ha_across_az" {
  name         = "networking-stack"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM"]
  disable_rollback = "true"
  parameters = {
    uniqueString             = "f5demo"
    vpcId                    = data.aws_vpc.security_vpc_id[0].id
    vpcCidr                  = data.aws_vpc.security_vpc_id[0].cidr_block
    bigIpMgmtSubnetId01      = data.aws_subnet.security_vpc_sub_management_a_id[0].id
    bigIpMgmtSubnetId02      = data.aws_subnet.security_vpc_sub_management_b_id[0].id
    bigIpExternalSubnetId01  = data.aws_subnet.security_vpc_sub_external_a_id[0].id
    bigIpExternalSubnetId02  = data.aws_subnet.security_vpc_sub_external_b_id[0].id
    bigIpInternalSubnetId01  = data.aws_subnet.security_vpc_sub_internal_a_id[0].id
    bigIpInternalSubnetId02  = data.aws_subnet.security_vpc_sub_internal_b_id[0].id
    bigIpMgmtAddress01       = "10.10.1.11"
    bigIpMgmtAddress02       = "10.10.2.11"
    bigIpExternalSelfIp01    = "10.10.3.11"
    bigIpExternalSelfIp02    = "10.10.4.11"
    bigIpInternalSelfIp01    = "10.10.5.11"
    bigIpInternalSelfIp02    = "10.10.6.11"
    bigIpExternalVip01       = "10.10.3.110"
    bigIpExternalVip02       = "10.10.4.110"
    bigIpPeerAddr            = "10.10.1.11"
    cfeVipTag                = "10.10.3.110,10.10.4.110"
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
