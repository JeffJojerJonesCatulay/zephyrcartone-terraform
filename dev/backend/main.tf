resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = var.lock_table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }
}