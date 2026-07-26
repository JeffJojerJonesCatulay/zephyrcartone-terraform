# -----------------------------------------------
# Provider Related Resources
# -----------------------------------------------
variable "provider_region" {
  type        = string
  description = "Provider region"
}

# -----------------------------------------------
# Lambda Related Resources
# -----------------------------------------------
variable "lambda_customer_handler" {
  type        = string
}

variable "lambda_customer_function_name" {
  type        = string
  description = "Name of the lambda function"
}

variable "lambda_customer_runtime" {
  type        = string
  description = "Runtime of the lambda function"
}

variable "lambda_customer_filename" {
  type        = string
  description = "Name of the lambda function file"
}

variable "lambda_role_name" {
  description = "Name of the lambda role"
  type        = string
}

variable "lambda_role_policy_arn" {
  description = "ARN of the lambda role policy"
  type        = string
}

# -----------------------------------------------
# DynamoDB Related Resources
# -----------------------------------------------
variable "aws_region_customer" {
  description = "AWS region for DynamoDB"
  type        = string
}

variable "dynamodb_customer_table" {
  description = "DynamoDB table name"
  type        = string
}

variable "hash_key" {
  description = "Name of the hash key"
  type        = string
}

variable "attribute_types" {
  description = "Type of the attribute"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode of the DynamoDB table"
  type        = string
}

variable "customer_lambda_dynamodb_crud_policy_name" {
  description = "Name of the lambda dynamodb crud policy"
  type        = string
}
