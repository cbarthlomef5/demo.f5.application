output "bigip_mgmip_a" {
  value = aws_cloudformation_stack.network.parameters.bigIpMgmtAddress01
}

output "webserver_pool" {
  value = concat(aws_instance.webserver-aza[*].private_ip, aws_instance.webserver-azb[*].private_ip)
}

output "management_subnet_a_id" {
  value = aws_subnet.management-a.id
}

output "external_subnet_a_id" {
  value = aws_subnet.external-a.id
}

output "bigip_objects_json" {
  value = local.bigip_json
}