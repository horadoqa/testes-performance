resource "aws_instance" "serverest" {
  count                  = var.number_instances
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  tags                   = merge(var.tags_serverest, { Name = "serverest-${count.index + 1}" })
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_instance" "k6" {
  count                  = var.number_instances
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  tags                   = merge(var.tags_k6, { Name = "k6-${count.index + 1}" })
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_instance" "grafana" {
  count                  = var.number_instances
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  tags                   = merge(var.tags_grafana, { Name = "grafana-${count.index + 1}" })
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}