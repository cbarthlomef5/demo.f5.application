data "aws_subnets" "servers_vpc_sub" {
    tags = {
        "VPC" = "servers"
    }
}

data "aws_subnet" "servers_vpc_sub_id" {
  count = length(data.aws_subnets.servers_vpc_sub.ids)
  id = tolist(data.aws_subnets.servers_vpc_sub.ids)[0]
}

data "template_file" "webserver_configuration" {
  template = file("${path.module}/scripts/bash/bootstrapWebserver.sh")
  vars = {
    app_config = file("${path.module}/apps/index.php")
    nginx_config = file("${path.module}/apps/apps.conf")
  }
}