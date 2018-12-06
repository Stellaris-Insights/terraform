# terraform state setup

terraform {
  backend "s3" {
    encrypt = true
    region = "us-west-2"
    profile = "stellaris"
    key = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
  profile = "stellaris"
}

module "s3-backend" {
  source = "modules/s3-backend"
}

resource "aws_kms_key" "kms-key" {
    description = "stellaris-insights-kms-key"
    enable_key_rotation = true
}
