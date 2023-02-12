include {
  path = find_in_parent_folders()
}

dependency "frontend" {
  config_path = "../frontend"
}

terraform {
  source = "../../modules/policy"
}

inputs = {
  bucket_name = dependency.frontend.outputs.bucket_name
  cloudfront_id = dependency.frontend.outputs.cloudfront_id
}