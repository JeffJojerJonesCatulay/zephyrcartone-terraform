# -----------------------------------------------
# DynamoDB Related Resources
# -----------------------------------------------

module "dynamodb_table" {
  source = "../modules/aws_dynamodb"
  dynamodb_table = var.dynamodb_customer_table
  billing_mode = var.billing_mode
  hash_key = var.hash_key
  attribute_types = var.attribute_types
}

# -----------------------------------------------
# Lambda Related Resources
# -----------------------------------------------

module "aws_lambda_role" {
    source = "../modules/aws_iam/lambda"
    lambda_role_name = var.lambda_role_name
    lambda_role_policy_arn = var.lambda_role_policy_arn
    lambda_dynamodb_crud_policy_name = var.customer_lambda_dynamodb_crud_policy_name
    dynamodb_table_arn = module.dynamodb_table.aws_dynamodb_table_arn
}

module "aws_lambda" {
    source                        = "../modules/aws_lambda"
    lambda_function_name = var.lambda_customer_function_name
    lambda_exec_role_arn          = module.aws_lambda_role.lambda_exec_role_arn
    lambda_handler       = var.lambda_customer_handler
    lambda_runtime       = var.lambda_customer_runtime
    lambda_filename      = var.lambda_customer_filename
    timeout                       = 20
    memory_size                   = 1024

    environment_variables = {
      "CUSTOMER_TABLE_NAME" = var.dynamodb_customer_table
      "REGION_DYNAMODB_NAME" = var.aws_region_customer
    }
}


