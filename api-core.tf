# stellaris insights api core setup
resource "aws_dynamodb_table" "upload-sessions" {
  name = "upload-sessions"
  hash_key = "sessionId"
  range_key = "sessionSecretHash"

  billing_mode = "PAY_PER_REQUEST"
 
  attribute {
    name = "sessionId"
    type = "S"
  }
  attribute {
    name = "sessionSecretHash"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
 
  tags {
    Name = "Upload Sessions Table"
  }
}

module "api-core-cicd" {
    source = "modules/cicd"
    prefix = "stellaris-insights-api-core"
    kms-key-arn = "${aws_kms_key.kms-key.arn}"
}