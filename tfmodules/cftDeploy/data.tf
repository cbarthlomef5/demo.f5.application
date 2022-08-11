data "aws_subnets" "security_vpc_sub_management_a" {
    tags = {
        "VPC" = "security"
        "Name" = "security_vpc-management_a-sub"
    }
}

data "aws_subnet" "security_vpc_sub_management_a_id" {
  count = length(data.aws_subnets.security_vpc_sub_management_a.ids)
  id = tolist(data.aws_subnets.security_vpc_sub_management_a.ids)[0]
}

data "aws_subnets" "security_vpc_sub_management_b" {
    tags = {
        "VPC" = "security"
        "Name" = "security_vpc-management_b-sub"
    }
}

data "aws_subnet" "security_vpc_sub_management_b_id" {
  count = length(data.aws_subnets.security_vpc_sub_management_b.ids)
  id = tolist(data.aws_subnets.security_vpc_sub_management_b.ids)[0]
}

data "aws_subnets" "security_vpc_sub_external_a" {
    tags = {
        "VPC" = "security"
        "Name" = "security_vpc-external_a-sub"
    }
}

data "aws_subnet" "security_vpc_sub_external_a_id" {
  count = length(data.aws_subnets.security_vpc_sub_external_a.ids)
  id = tolist(data.aws_subnets.security_vpc_sub_external_a.ids)[0]
}

data "aws_subnets" "security_vpc_sub_external_b" {
    tags = {
        "VPC" = "security"
        "Name" = "security_vpc-external_b-sub"
    }
}

data "aws_subnet" "security_vpc_sub_external_b_id" {
  count = length(data.aws_subnets.security_vpc_sub_external_b.ids)
  id = tolist(data.aws_subnets.security_vpc_sub_external_b.ids)[0]
}

data "aws_subnets" "security_vpc_sub_internal_a" {
    tags = {
        "VPC" = "security"
        "Name" = "security_vpc-internal_a-sub"
    }
}

data "aws_subnet" "security_vpc_sub_internal_a_id" {
  count = length(data.aws_subnets.security_vpc_sub_internal_a.ids)
  id = tolist(data.aws_subnets.security_vpc_sub_internal_a.ids)[0]
}

data "aws_subnets" "security_vpc_sub_internal_b" {
    tags = {
        "VPC" = "security"
        "Name" = "security_vpc-internal_b-sub"
    }
}

data "aws_subnet" "security_vpc_sub_internal_b_id" {
  count = length(data.aws_subnets.security_vpc_sub_internal_b.ids)
  id = tolist(data.aws_subnets.security_vpc_sub_internal_b.ids)[0]
}

data "aws_vpcs" "security_vpc_info" {
  tags = {
        "VPC" = "security"
    }
}

data "aws_vpc" "security_vpc_id" {
  count = length(data.aws_vpcs.security_vpc_info.ids)
  id = tolist(data.aws_vpcs.security_vpc_info.ids)[0]
}