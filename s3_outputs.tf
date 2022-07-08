output "source_s3_bucket" {
  value = aws_s3_bucket.source_bucket.id
}

output "source_s3_bucket_arn" {
  value = aws_s3_bucket.source_bucket.arn
}

output "destination_s3_bucket" {
  value = aws_s3_bucket.destination_bucket.id
}

output "destination_s3_bucket_arn" {
  value = aws_s3_bucket.destination_bucket.arn
}

output "s3_iam_role_arn" {
  value = aws_iam_role.s3_replication.arn
}

