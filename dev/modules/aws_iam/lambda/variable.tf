variable "lambda_role_name" {
  description = "Name of the lambda role"
  type        = string
}

variable "lambda_role_policy_arn" {
  description = "ARN of the lambda role policy"
  type        = string
}

variable "lambda_dynamodb_crud_policy_name" {
  description = "Name of the lambda dynamodb crud policy"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the dynamodb table"
  type        = string
}