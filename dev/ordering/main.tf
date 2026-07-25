module "aws_lambda_role" {
    source = "../modules/aws_iam/lambda"
}

resource "aws_lambda_function" "ordering_lambda" {
    function_name = var.lambda_ordering_function_name
    role = module.aws_lambda_role.lambda_exec_role_arn
    handler = var.lambda_ordering_handler
    runtime = var.lambda_ordering_runtime
    
    filename = var.lambda_ordering_filename

    environment {
        variables = {
            "ORDERS_TABLE_NAME" = var.dynamodb_ordering_table,
            "REGION_DYNAMODB_NAME" = var.aws_region_ordering
        }
    }

}