locals {
  bigip_json = jsonencode(
    {
      "bigip_a_mgmt_ip"="${aws_cloudformation_stack.network.parameters.bigIpMgmtAddress01}", 
      "webserver_pool_nodes" = concat(aws_instance.webserver-aza[*].private_ip, aws_instance.webserver-azb[*].private_ip)
    }
  )
}