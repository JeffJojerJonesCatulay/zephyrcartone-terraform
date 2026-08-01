# Customer Microservice Infrastructure (`dev/customer`)

This stack provisions the AWS infrastructure for the **Customer Microservice**, including DynamoDB table storage, IAM permissions, and AWS Lambda functions for customer data operations.

---

## 🏗️ Architecture & Resources Created

- **Amazon DynamoDB Table**: Customer data table provisioned via [`aws_dynamodb`](../modules/aws_dynamodb/README.md).
- **IAM Role & Policies**: Execution role and CRUD policy for Lambda functions created via [`aws_iam/lambda`](../modules/aws_iam/lambda/README.md).
- **AWS Lambda Functions**:
  - `aws_lambda_customer_put`: Adds or updates customer profiles.
  - `aws_lambda_customer_get`: Retrieves customer profile details.

---

## ⚙️ Configuration & Environment Variables

### Lambda Environment Variables
- `CUSTOMER_TABLE_NAME`: Name of the DynamoDB table.
- `REGION_DYNAMODB_NAME`: Target AWS region for DynamoDB client connection.

### Variables (`terraform.tfvars`)
Key variables supplied via `terraform.tfvars`:
- `dynamodb_customer_table`: DynamoDB table name.
- `lambda_customer_filename`: Path to compiled `.jar` executable artifact (`build/customer.module.jar`).
- `lambda_customer_put_handler`: Handler class method for customer PUT action.
- `lambda_customer_get_handler`: Handler class method for customer GET action.

---

## 🚀 Deployment Instructions

```bash
cd dev/customer

# Initialize backend using remote configuration
terraform init -backend-config=backend.hcl

# Plan and Apply
terraform plan
terraform apply
```
