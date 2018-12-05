# terraform state file setup
# create an S3 bucket to store the state file in

provider "aws" {
  region = "us-west-2"
  profile = "stellaris"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "terraform-remote-state-storage-s3"
    dynamodb_table = "terraform-state-lock-dynamo"
    region = "us-west-2"
    key = ""
  }
}
