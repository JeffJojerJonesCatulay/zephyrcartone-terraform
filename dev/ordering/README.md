# Ordering Microservice Infrastructure (`dev/ordering`)

This stack provisions the AWS infrastructure for the **Ordering Microservice**, including DynamoDB table storage, Ordering Lambda function, IAM execution roles, and **AWS Step Functions Workflow State Machine**.

---

## 🏗️ Architecture & Resources Created

- **Amazon DynamoDB Table**: Ordering database table provisioned via [`aws_dynamodb`](../modules/aws_dynamodb/README.md).
- **IAM Roles & Policies**:
  - Lambda execution role & DynamoDB CRUD policy created via [`aws_iam/lambda`](../modules/aws_iam/lambda/README.md).
  - Step Functions execution role created via [`aws_iam/step_funtions`](../modules/aws_iam/step_funtions/README.md).
- **AWS Lambda Function**: `aws_lambda` ordering execution function deployed via [`aws_lambda`](../modules/aws_lambda/README.md).
- **AWS Step Functions State Machine**: Order workflow state machine provisioned via [`aws_step_functiom`](../modules/aws_step_functiom/README.md).

---

## ⚙️ Configuration & Environment Variables

### Lambda Environment Variables
- `ORDERS_TABLE_NAME`: Name of the DynamoDB table storing order transactions.
- `REGION_DYNAMODB_NAME`: Target AWS region for DynamoDB client connection.

### Variables (`terraform.tfvars`)
Key variables supplied via `terraform.tfvars`:
- `dynamodb_ordering_table`: Ordering DynamoDB table name.
- `lambda_ordering_filename`: Path to compiled `.jar` artifact (`build/ordering.jar`).
- `state_machine_name`: Name of the Step Functions State Machine.
- `state_machine_definition`: JSON definition string describing workflow execution steps.

---

## 🚀 Deployment Instructions

```bash
cd dev/ordering

# Initialize backend using remote configuration
terraform init -backend-config=backend.hcl

# Plan and Apply
terraform plan
terraform apply
```
