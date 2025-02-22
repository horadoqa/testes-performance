# Fazer o pull de alguma info do S3
data "aws_caller_identity" "current" {}


# Fazer o push do remote state para S3
resource "aws_s3_bucket" "remote_state" {

  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  tags = {
    Description = "Stores terraform remote state files"
    ManagedBy   = "Terraform"
    Owner       = "Ricardo Fahham"
    Created     = "2024-02-22"
  }

}

resource "aws_s3_bucket_versioning" "versioning_remote_state" {
  bucket = aws_s3_bucket.remote_state.id
  versioning_configuration {
    status = "Enabled"
  }
}