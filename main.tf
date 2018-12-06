# terraform state file setup
# create an S3 bucket to store the state file in

provider "aws" {
  region = "us-west-2"
  profile = "stellaris"
}

module "s3-backend" {
  source = "modules/s3-backend"
}

terraform {
  backend "s3" {
    encrypt = true
    region = "us-west-2"
    profile = "stellaris"
    key = "us-west-2"
  }
}
