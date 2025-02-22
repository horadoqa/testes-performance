resource "aws_instance" "prometheus" {
  count                  = var.number_instances
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  tags                   = var.tags_prometheus
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_instance" "grafana" {
  count                  = var.number_instances
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  tags                   = var.tags_grafana
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}