variable "number_instances" {
  type        = number
  description = "Numero de instancias"
  default     = 1
}

variable "aws_ami" {
  type = string
  # default   = "ami-04b4f1a9cf54c11d0"
  description = "Imagem da instância"
}

variable "instance_type" {
  type = string
  # default     = "t3.micro"
  description = "Tipo da Instância"
}

variable "tags_serverest" {
  type = map(string)
  default = {
    Name    = "serverest"
    Project = "ServeRest"
  }
  description = "serverest"
}

variable "tags_k6" {
  type = map(string)
  default = {
    Name    = "k6"
    Project = "k6"
  }
  description = "k6"
}

variable "tags_grafana" {
  type = map(string)
  default = {
    Name    = "Grafana"
    Project = "Grafana"
  }
  description = "Grafana"
}

variable "aws_region" {
  type = string
  # default     = "us-east-1"
  description = "Região onde será criada a instância"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Profile do terraform que está sendo utilizado"
}

variable "prefix_name" {
  type        = string
  description = "Type your name"
}
