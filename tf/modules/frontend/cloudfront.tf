resource "aws_cloudfront_origin_access_control" "resume_bucket_oac" {
  name                              = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
  description                       = "resume bucket policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.resume_bucket_oac.id
    origin_id                = aws_s3_bucket.resume_bucket.id
  }

  enabled             = true
  default_root_object = "index.html"
  aliases             = ["chayutpong.link"]

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.resume_bucket.id
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    cache_policy_id        = data.aws_cloudfront_cache_policy.ManagedCachingOptimized.id
  }
}

data "aws_cloudfront_cache_policy" "ManagedCachingOptimized" {
  name = "Managed-CachingOptimized"
}
