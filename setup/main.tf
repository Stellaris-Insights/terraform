# terraform state resources setup
provider "aws" {
  region = "us-west-2"
  profile = "stellaris"
}

module "s3-backend" {
  source = "../modules/s3-backend"
}

output "bucket" {
  value = "\"${module.s3-backend.s3-bucket}\""
}

output "dynamodb_table" {
  value = "\"${module.s3-backend.dynamodb-table}\""
}