output "bucket_name" {
  value = aws_s3_bucket.resume_bucket.id
}

output "distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}
