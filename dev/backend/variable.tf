variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "lock_table_name" {
  description = "Name of the DynamoDB lock table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB"
  type        = string
}

variable "hash_key" {
  description = "Name of the DynamoDB hash key"
  type        = string
}

variable "hash_key_type" {
  description = "Type of the DynamoDB hash key"
  type        = string
}