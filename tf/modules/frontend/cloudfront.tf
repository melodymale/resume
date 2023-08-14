resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    origin_id   = var.bucket_name
    domain_name = aws_s3_bucket_website_configuration.s3_web_hosting.website_endpoint
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled = true
  aliases = ["chayutpong.link"]

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
