data "aws_subnets" "servers_vpc_sub" {
    tags = {
        "VPC" = "servers"
    }
}

data "aws_subnet" "servers_vpc_sub_id" {
  count = length(data.aws_subnets.servers_vpc_sub.ids)
  id = tolist(data.aws_subnets.servers_vpc_sub.ids)[0]
}