resource "aws_s3_bucket" "bucket" {
  bucket = "${var.prefix}-cicd"
  acl    = "private"
}