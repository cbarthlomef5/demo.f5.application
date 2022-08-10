output "webserver_pool_nodes" {
  value = concat(aws_instance.webserver-aza[*].private_ip, aws_instance.webserver-azb[*].private_ip)
}

output "bigip_pw_arn" {
  value = aws_secretsmanager_secret.bigip_pw_secret_id.arn
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "management_a_subnet" {
  value = aws_subnet.management-a.id
}

output "management_b_subnet" {
  value = aws_subnet.management-b.id
}

output "external_a_subnet" {
  value = aws_subnet.external-a.id
}

output "external_b_subnet" {
  value = aws_subnet.external-b.id
}

output "internal_a_subnet" {
  value = aws_subnet.internal-a.id
}

output "internal_b_subnet" {
  value = aws_subnet.internal-b.id
}