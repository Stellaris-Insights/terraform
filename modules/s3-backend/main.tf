# terraform state resources setup

# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "stellaris-insights-terraform-remote-state-storage-s3"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "S3 Remote Terraform State Store"
  }      
}

# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"

  billing_mode = "PAY_PER_REQUEST"
 
  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
 
  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

# outputs for access to names
output "s3-bucket" {
  value = "${aws_s3_bucket.terraform-state-storage-s3.bucket}"
}

output "dynamodb-table" {
  value = "${aws_dynamodb_table.dynamodb-terraform-state-lock.name}"
}

