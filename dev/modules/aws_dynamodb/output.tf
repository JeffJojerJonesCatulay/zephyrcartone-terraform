output "aws_dynamodb_table_arn" {
  description = "ARN of the dynamodb table"
  value       = aws_dynamodb_table.dynamodb_table.arn
}