include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/frontend"
}

inputs = {
  bucket_name = "chayutpong-resume-develop"
  region      = "ap-southeast-2"
}