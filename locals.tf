locals {
  bastion_host_vpc_id = tolist(data.aws_vpcs.bastion_host_vpc.ids)[0]
  security_vpc_id = tolist(data.aws_vpcs.security_vpc.ids)[0]
  servers_vpc_id = tolist(data.aws_vpcs.servers_vpc.ids)[0]
  workstations_vpc_id = tolist(data.aws_vpcs.workstations_vpc.ids)[0]
}