output "bigip_a_mgmt_ip" {
  value = aws_cloudformation_stack.network.parameters.bigIpMgmtAddress01
}