resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb_table
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = var.attribute_types
  }
}
