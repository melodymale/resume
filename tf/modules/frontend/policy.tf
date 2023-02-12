data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "cloudfront_s3_policy" {
  statement {
    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.resume_bucket.id}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      values   = ["arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"]
      variable = "AWS:SourceArn"
    }
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.cloudfront_s3_policy.json
}
