# AWS Lambda Function Module (`dev/modules/aws_lambda`)

This module provisions an AWS Lambda function with runtime configuration, memory, timeout, execution role, and environment variables.

---

## 📥 Inputs

| Name | Type | Description | Default | Required |
| :--- | :--- | :--- | :--- | :---: |
| `lambda_function_name` | `string` | Name of the Lambda function | - | Yes |
| `lambda_exec_role_arn` | `string` | IAM execution role ARN for the function | - | Yes |
| `lambda_handler` | `string` | Entry point handler string (e.g. `com.zephyrcart.Handler::handleRequest`) | - | Yes |
| `lambda_runtime` | `string` | Runtime environment (e.g. `java21` or `java17`) | - | Yes |
| `lambda_filename` | `string` | Local path to deployment package archive (`.jar` or `.zip`) | - | Yes |
| `timeout` | `number` | Function execution timeout in seconds | - | Yes |
| `memory_size` | `number` | Memory allocated to the function in MB | - | Yes |
| `environment_variables` | `map(string)` | Key-value pairs for environment variables | `{}` | No |

---

## 📤 Outputs

None explicitly exposed (invokes `aws_lambda_function.lambda_function`).

---

## 💻 Example Usage

```hcl
module "aws_lambda_service" {
  source               = "../modules/aws_lambda"
  lambda_function_name = "customer-get-function"
  lambda_exec_role_arn = module.aws_lambda_role.lambda_exec_role_arn
  lambda_runtime       = "java21"
  lambda_filename      = "build/customer.module.jar"
  lambda_handler       = "com.zephyrcartone.customer.GetCustomerHandler::handleRequest"
  timeout              = 20
  memory_size          = 1024

  environment_variables = {
    "CUSTOMER_TABLE_NAME" = "CustomerTable"
    "REGION_DYNAMODB_NAME" = "ap-southeast-1"
  }
}
```
