resource "aws_s3_bucket" "resume_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

output "bucket_name" {
  value = aws_s3_bucket.resume_bucket.id
}
