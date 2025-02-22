#Generate private key

resource "aws_key_pair" "this" {
  key_name   = "aws-instance-key"
  public_key = file("~/.ssh/id_rsa.pub")
}