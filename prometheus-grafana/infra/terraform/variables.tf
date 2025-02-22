variable "aws_region" {
  type = string
  # default     = "us-east-1"
  description = "Região onde será criada a instância"
}

variable "aws_profile" {
  type = string
  # default     = "terraform"
  description = "Profile do terraform que está sendo utilizado"
}

variable "aws_ami" {
  type = string
  # default     = "ami-0e731c8a588258d0d"
  description = "Imagem da instância"
}

variable "instance_type" {
  type = string
  # default     = "t3.micro"
  description = "Tipo da Instância"
}

variable "tags_prometheus" {
  type = map(string)
  default = {
    Name    = "prometheus"
    Project = "Prometheus-Grafana"
  }
  description = "Prometheus"
}

variable "tags_grafana" {
  type = map(string)
  default = {
    Name    = "grafana"
    Project = "Prometheus-Grafana"
  }
  description = "Grafana"
}

variable "number_instances" {
  type        = number
  description = "Numero de instancias"
  default     = 1
}

variable "prefix_name" {
  type        = string
  description = "Type your name"
}
