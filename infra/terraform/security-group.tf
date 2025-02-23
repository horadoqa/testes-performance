resource "aws_security_group" "security_group" {
  name        = "${var.prefix_name}-sg"
  description = "Allow Inbound Traffic"

  # Permitir tráfego HTTP (porta 80) para a instância Serverest
  ingress {
    description = "Port 80 for Serverest (HTTP)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir tráfego na porta 3000 para o Grafana e o Serverest
  ingress {
    description = "Port 3000 for Grafana and Serverest"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Permitir tráfego HTTPS (porta 443) para Serverest (se necessário)
  ingress {
    description = "Port 443 for Serverest (HTTPS)"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]  # Ajustar conforme necessário para IPs específicos
  }

  # Permitir acesso ao Prometheus (porta 9090)
  ingress {
    description = "Prometheus (porta 9090)"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ou limitar ao IP do Grafana, por exemplo
  }

  # Permitir acesso ao Node Exporter (porta 9100)
  ingress {
    description = "Node Exporter (porta 9100)"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ou limitar ao IP do Prometheus ou Grafana
  }

  # Permitir SSH apenas de um IP específico (substitua pelo seu IP)
  ingress {
    description = "SSH (porta 22) from My IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"]
  }

  # Permitir tráfego ICMP (ping) de qualquer IP (ou pode restringir para o IP do k6)
  ingress {
    description = "Allow ICMP (ping) from k6 server"
    from_port   = -1        # ICMP não usa portas específicas
    to_port     = -1        # ICMP não usa portas específicas
    protocol    = "icmp"    # Especificando o protocolo ICMP
    cidr_blocks = ["172.31.34.213/32"]  # Substitua pelo IP da instância do k6
  }

  # Egress (permitir saída para qualquer destino)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
