# Item Microservice Infrastructure (`dev/item`)

This stack provisions the AWS infrastructure for the **Item/Catalog Microservice**, including DynamoDB item storage, IAM permissions, and AWS Lambda functions for catalog item management.

---

## 🏗️ Architecture & Resources Created

- **Amazon DynamoDB Table**: Items catalog table provisioned via [`aws_dynamodb`](../modules/aws_dynamodb/README.md).
- **IAM Role & Policies**: Execution role and CRUD policy for Lambda functions created via [`aws_iam/lambda`](../modules/aws_iam/lambda/README.md).
- **AWS Lambda Functions**:
  - `aws_lambda_item_put`: Adds or updates item records in catalog.
  - `aws_lambda_item_get`: Fetches item details from catalog.

---

## ⚙️ Configuration & Environment Variables

### Lambda Environment Variables
- `ITEMS_TABLE_NAME`: Name of the DynamoDB items table.
- `REGION_DYNAMODB_NAME`: Target AWS region for DynamoDB client connection.

### Variables (`terraform.tfvars`)
Key variables supplied via `terraform.tfvars`:
- `dynamodb_item_table`: DynamoDB table name.
- `lambda_item_filename`: Path to compiled `.jar` executable artifact (`build/item.module.jar`).
- `lambda_item_put_handler`: Handler class method for item PUT action.
- `lambda_item_get_handler`: Handler class method for item GET action.

---

## 🚀 Deployment Instructions

```bash
cd dev/item

# Initialize backend using remote configuration
terraform init -backend-config=backend.hcl

# Plan and Apply
terraform plan
terraform apply
```
