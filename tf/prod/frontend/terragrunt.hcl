include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/frontend"
}

inputs = {
  bucket_name = "chayutpong-resume"
  region      = "ap-southeast-2"
}