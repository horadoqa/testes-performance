Para que você consiga realizar os testes com o **k6** para a instância **Serverest**, visualizar os gráficos no **Grafana**, e permitir o tráfego adequado para o **Prometheus** e **Node Exporter**, precisamos ajustar as regras de **Security Group**.

Vou sugerir as seguintes modificações e explicações:

### Requisitos
1. **k6** precisa enviar requisições HTTP para o **Serverest**.
2. O **Grafana** precisa acessar o **Prometheus** na porta **9090** e o **Node Exporter** na porta **9100**.
3. O **Grafana** precisa ser acessado pela porta **3000** de um IP específico ou público.
4. Além disso, você deve garantir que o tráfego de **SSH (porta 22)** seja permitido apenas a partir de um IP específico.

### Correções e Ajustes

#### 1. **Regras de Ingress**:
   - O **k6** enviará requisições HTTP para o **Serverest**, então a instância **Serverest** precisa aceitar requisições na porta **80**.
   - O **Grafana** precisa ser acessado na porta **3000**.
   - O **Prometheus** precisa ser acessado na porta **9090** para monitoramento.
   - O **Node Exporter** precisa ser acessado na porta **9100**.
   - O **SSH** na porta **22** deve ser restrito a um IP específico ou bloco de IPs.

#### 2. **Correções no `Security Group`**:
Aqui está uma versão corrigida do seu **Security Group**:

```hcl
resource "aws_security_group" "security_group" {
  name        = "${var.prefix_name}-sg"
  description = "Allow Inbound Traffic"

  # Permitir tráfego HTTP (porta 80) para a instância Serverest
  ingress {
    description = "Port 80 for Serverest (HTTP)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir de qualquer IP, ou use IP específico para k6
  }

  # Permitir tráfego HTTPS (porta 443) para Serverest (se necessário)
  ingress {
    description = "Port 443 for Serverest (HTTPS)"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ajustar conforme necessário para IPs específicos
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

  # Permitir acesso ao Grafana (porta 3000)
  ingress {
    description = "Grafana (porta 3000)"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ou limitar ao IP de quem for acessar o Grafana
  }

  # Permitir SSH apenas de um IP específico (substitua pelo seu IP)
  ingress {
    description = "SSH (porta 22) from My IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["<SEU_IP>/32"]  # Substitua <SEU_IP> pelo seu IP ou bloco de IPs
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
```

### Explicações das Regras:

1. **HTTP (Porta 80)**:
   - Permite tráfego de entrada na porta 80 para a instância **Serverest** (onde o **k6** vai enviar os testes).
   - Use `cidr_blocks = ["0.0.0.0/0"]` para permitir o tráfego de qualquer lugar, ou substitua por um IP específico se quiser restringir.

2. **HTTPS (Porta 443)**:
   - Se o **Serverest** também estiver configurado para aceitar conexões HTTPS, essa regra permitirá o tráfego na porta 443.

3. **Prometheus (Porta 9090)**:
   - Permite que o **Grafana** acesse o **Prometheus** para coletar métricas, liberando o tráfego na porta 9090.
   - Você pode restringir essa regra a apenas o IP da instância **Grafana** ou permitir o tráfego de qualquer lugar, dependendo de suas necessidades.

4. **Node Exporter (Porta 9100)**:
   - Permite que o **Prometheus** colete métricas do **Node Exporter**, liberando o tráfego na porta 9100.
   - Assim como a porta do Prometheus, você pode restringir o acesso para o IP do **Prometheus** ou permitir de qualquer lugar.

5. **Grafana (Porta 3000)**:
   - Permite acesso à interface do **Grafana** pela porta 3000.
   - Restrinja o acesso dessa porta a IPs específicos para maior segurança, por exemplo, ao IP de quem vai acessar o **Grafana**.

6. **SSH (Porta 22)**:
   - Restrinja o acesso SSH à instância a partir de um IP específico (no seu caso, provavelmente o seu IP), evitando que qualquer pessoa acesse a instância via SSH.

### Conclusão:
Com esse **Security Group**, você poderá realizar o teste com o **k6** para o **Serverest**, acessar o **Prometheus** para coletar métricas, e visualizar as métricas no **Grafana**. Certifique-se de ajustar os **CIDR blocks** de acordo com a segurança da sua rede (por exemplo, permitindo acesso apenas aos IPs necessários).