# Reusable Terraform Modules Library (`dev/modules`)

This directory contains local reusable Terraform modules that encapsulate infrastructure patterns for AWS resources across **ZephyrCartOne** microservices.

---

## 🧩 Module Index

| Module Path | Description | Documentation |
| :--- | :--- | :--- |
| `aws_dynamodb/` | AWS DynamoDB Table provisioner | [aws_dynamodb README](aws_dynamodb/README.md) |
| `aws_iam/` | IAM roles & policies parent module group | [aws_iam README](aws_iam/README.md) |
| `aws_iam/lambda/` | Lambda execution role & DynamoDB CRUD policy | [aws_iam/lambda README](aws_iam/lambda/README.md) |
| `aws_iam/step_funtions/` | Step Functions execution role & policy attachments | [aws_iam/step_funtions README](aws_iam/step_funtions/README.md) |
| `aws_lambda/` | AWS Lambda function provisioner | [aws_lambda README](aws_lambda/README.md) |
| `aws_step_functiom/` | AWS Step Functions State Machine provisioner | [aws_step_functiom README](aws_step_functiom/README.md) |

---

## 📐 Best Practices & Principles

- **Separation of Concerns**: Infrastructure primitives (DynamoDB, Lambda, IAM) are kept modularized and clean.
- **Configurability**: Modules expose clear input variables and provide explicit resource outputs (ARNs, names).
- **Least Privilege**: IAM modules grant narrow policy scopes (e.g. scoping DynamoDB permissions strictly to specified table ARNs).
