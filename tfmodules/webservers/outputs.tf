output "webserver_pool_nodes" {
  value = aws_instance.nginx_web_server[*].private_ip
}