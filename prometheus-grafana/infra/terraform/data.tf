# Get my public ip
data "http" "ip" {
  # url = "https://ipv4.icanhazip.com" quebra de linha
  url = "https://api4.ipify.org"
}

# data "grafana" "ip" {
#     value = aws_instance.grafana.*.public_ip
# }
