resource "aws_lambda_function" "lambda_function" {
    function_name = var.lambda_ordering_function_name
    role = var.lambda_exec_role_arn
    handler = var.lambda_ordering_handler
    runtime = var.lambda_ordering_runtime
    filename = var.lambda_ordering_filename
    timeout = var.timeout
    memory_size = var.memory_size

    environment {
        variables = var.environment_variables
    }
}