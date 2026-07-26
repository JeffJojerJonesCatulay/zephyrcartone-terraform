resource "aws_lambda_function" "lambda_function" {
    function_name = var.lambda_function_name
    role = var.lambda_exec_role_arn
    handler = var.lambda_handler
    runtime = var.lambda_runtime
    filename = var.lambda_filename
    timeout = var.timeout
    memory_size = var.memory_size

    environment {
        variables = var.environment_variables
    }
}