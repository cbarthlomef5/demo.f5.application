output "my_public_ip" {
  value = "${data.external.myipaddr.result.ip}"
}