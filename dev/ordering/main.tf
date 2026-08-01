# -----------------------------------------------
# DynamoDB Related Resources
# -----------------------------------------------

module "dynamodb_table" {
  source = "../modules/aws_dynamodb"
  dynamodb_table = var.dynamodb_ordering_table
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
    lambda_dynamodb_crud_policy_name = var.order_lambda_dynamodb_crud_policy_name
    dynamodb_table_arn = module.dynamodb_table.aws_dynamodb_table_arn
}

module "aws_lambda" {
    source = "../modules/aws_lambda"
    lambda_function_name = var.lambda_ordering_function_name
    lambda_exec_role_arn = module.aws_lambda_role.lambda_exec_role_arn
    lambda_handler       = var.lambda_ordering_handler
    lambda_runtime       = var.lambda_ordering_runtime
    lambda_filename      = var.lambda_ordering_filename
    timeout = 20
    memory_size = 1024

    environment_variables = {
      "ORDERS_TABLE_NAME"    = var.dynamodb_ordering_table
      "REGION_DYNAMODB_NAME" = var.aws_region_ordering
    }
}

# -----------------------------------------------
# Step Function Related Resources
# -----------------------------------------------

module "aws_iam_step_functions_role" {
    source = "../modules/aws_iam/step_funtions"
    name = var.aws_sfn_role_name
    policy_arns = var.aws_sfn_policy_arns
}

module "aws_step_functiom" {
    source = "../modules/aws_step_functiom"
    state_machine_name = var.state_machine_name
    state_machine_definition = var.state_machine_definition
    state_machine_role_arn = module.aws_iam_step_functions_role.sfn_role
}