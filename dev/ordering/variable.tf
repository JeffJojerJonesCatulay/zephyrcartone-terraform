variable "aws_region_ordering" {
  description = "AWS region for DynamoDB"
  type        = string
}

variable "dynamodb_ordering_table" {
  description = "DynamoDB table name"
  type        = string
}

variable "lambda_ordering_handler" {
  type        = string
}

variable "lambda_ordering_function_name" {
  type        = string
  description = "Name of the lambda function"
}

variable "lambda_ordering_runtime" {
  type        = string
  description = "Runtime of the lambda function"
}

variable "lambda_ordering_filename" {
  type        = string
  description = "Name of the lambda function file"
}

variable "provider_region" {
  type        = string
  description = "Provider region"
}