# Development Environment (`dev`)

This directory contains all infrastructure stacks and modular components for the **ZephyrCartOne** development environment (`dev`).

---

## 📂 Environment Directory Layout

| Directory | Type | Description |
| :--- | :--- | :--- |
| [`backend/`](backend/README.md) | Terraform Stack | Provisions S3 bucket & DynamoDB lock table for remote state |
| [`customer/`](customer/README.md) | Microservice Stack | Deploys Customer DynamoDB table & Lambda functions (GET/PUT) |
| [`item/`](item/README.md) | Microservice Stack | Deploys Item DynamoDB table & Lambda functions (GET/PUT) |
| [`ordering/`](ordering/README.md) | Microservice Stack | Deploys Ordering DynamoDB table, Lambda function & Step Functions workflow |
| [`modules/`](modules/README.md) | Shared Modules | Local reusable Terraform modules for AWS components |

---

## 🛠 Infrastructure Workflow

1. **State Storage**: The `backend/` stack must be deployed first to create the S3 bucket and DynamoDB table for state locking.
2. **Isolated Stacks**: Each microservice stack (`customer`, `item`, `ordering`) manages its own independent state file configured via `backend.hcl`.
3. **Module Reuse**: Stacks invoke reusable modules located in [`modules/`](modules/README.md) to maintain DRY code standards across microservices.
