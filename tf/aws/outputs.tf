output "aws_bigip_mgmip_a" {
  value = aws_cloudformation_stack.network.parameters.bigIpMgmtAddress01
}

output "webserver_pool_aza" {
  value = aws_instance.webserver-aza[*].private_ip
}

output "webserver_pool_azb" {
  value = aws_instance.webserver-azb[*].private_ip
}