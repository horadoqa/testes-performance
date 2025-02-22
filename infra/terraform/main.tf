# Bloco de core, o primeiro a ser executado.

terraform {
  required_version = ">= 1.10.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-bucket-horadoqa"
    key    = "projetos/workon/terraform.tfstate"
    region = "us-east-1"
  }

  # Para deixar o backend dinâmico, remover os valores, será perguntado na implementação

}
