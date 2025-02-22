output "remote_state_bucket" {
  value = aws_s3_bucket.remote_state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote_state.arn
}

output "instance_public_ips_prometheus" {
  value = aws_instance.prometheus.*.public_ip
}

output "instance_public_ips_grafana" {
  value = aws_instance.grafana.*.public_ip
}
