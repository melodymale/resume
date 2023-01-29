terraform {
  source = "../../modules/frontend"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "chayutpong-resume-develop"
  region      = "ap-southeast-2"
}