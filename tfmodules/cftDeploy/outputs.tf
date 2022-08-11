output "bigip_a_mgmt_ip" {
  value = aws_cloudformation_stack.bigip_ha_across_az.parameters.bigIpMgmtAddress01
}