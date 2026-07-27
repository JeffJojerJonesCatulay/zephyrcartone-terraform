variable "lambda_handler" {
  type        = string
}

variable "lambda_function_name" {
  type        = string
  description = "Name of the lambda function"
}

variable "lambda_runtime" {
  type        = string
  description = "Runtime of the lambda function"
}

variable "lambda_filename" {
  type        = string
  description = "Name of the lambda function file"
}


variable "lambda_exec_role_arn" {
  description = "ARN of the lambda execution role"
  type        = string
}

variable "timeout" {
  type = number
  description = "Timeout of the lambda function"
}

variable "memory_size" {
  type = number
  description = "Memory size of the lambda function"
}

variable "environment_variables" {
  type        = map(string)
  description = "Map of environment variables for the Lambda function"
  default     = {}
}