output "aws_bigip_mgmip_a" {
  value = aws_cloudformation_stack.network.parameters.bigIpMgmtAddress01
}

output "webserver_pool" {
  value = concat(aws_instance.webserver-aza[*].private_ip, aws_instance.webserver-azb[*].private_ip)
}