# AWS IAM Lambda Role Module (`dev/modules/aws_iam/lambda`)

This module provisions an IAM role for AWS Lambda functions with trust policies for `lambda.amazonaws.com`, attaches a basic execution policy ARN, and attaches a granular inline/managed DynamoDB CRUD policy scoped to a specific DynamoDB table ARN.

---

## 📥 Inputs

| Name | Type | Description | Required |
| :--- | :--- | :--- | :---: |
| `lambda_role_name` | `string` | Name of the IAM role | Yes |
| `lambda_role_policy_arn` | `string` | Managed policy ARN to attach (e.g. AWSLambdaBasicExecutionRole) | Yes |
| `lambda_dynamodb_crud_policy_name` | `string` | Name for the DynamoDB CRUD policy | Yes |
| `dynamodb_table_arn` | `string` | Target DynamoDB Table ARN to grant CRUD access to | Yes |

---

## 📤 Outputs

| Name | Description |
| :--- | :--- |
| `lambda_exec_role_arn` | The ARN of the created IAM Lambda execution role |

---

## 💻 Example Usage

```hcl
module "aws_lambda_role" {
  source                           = "../modules/aws_iam/lambda"
  lambda_role_name                 = "customer_lambda_role"
  lambda_role_policy_arn           = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  lambda_dynamodb_crud_policy_name = "customer_dynamodb_crud_policy"
  dynamodb_table_arn               = module.dynamodb_table.aws_dynamodb_table_arn
}
```
