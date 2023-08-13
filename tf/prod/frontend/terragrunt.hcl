include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/frontend"
}

inputs = {
  bucket_name = "chayutpong-resume"
  region      = "ap-southeast-2"
  acm_certificate_arn = "arn:aws:acm:us-east-1:599497604578:certificate/d8e11c1e-9c02-4f13-b135-22c282b0439c"
}