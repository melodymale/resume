# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "terraform-state-133110104095"
    dynamodb_table = "terraform-state"
    encrypt        = true
    key            = "./terraform.tfstate"
    region         = "ap-southeast-2"
  }
}
