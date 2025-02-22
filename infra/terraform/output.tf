output "remote_state_bucket" {
  value = aws_s3_bucket.remote_state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote_state.arn
}

output "instance_public_ips_serverest" {
  value = aws_instance.serverest.*.public_ip
}

output "instance_public_ips_k6" {
  value = aws_instance.k6.*.public_ip
}

output "instance_public_ips_grafana" {
  value = aws_instance.grafana.*.public_ip
}