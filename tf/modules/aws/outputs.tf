output "management_subnet_a_id" {
  value = aws_subnet.management-a.id
}

output "external_subnet_a_id" {
  value = aws_subnet.external-a.id
}

output "bigip_objects_json" {
  value = local.bigip_json
}