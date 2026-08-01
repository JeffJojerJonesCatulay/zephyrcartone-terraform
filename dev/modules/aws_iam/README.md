# AWS IAM Modules Group (`dev/modules/aws_iam`)

This directory groups IAM role and policy creation modules for serverless application execution roles.

---

## 📂 Submodules

- [`lambda/`](lambda/README.md): Provisions IAM Execution Roles for AWS Lambda functions along with DynamoDB CRUD policies.
- [`step_funtions/`](step_funtions/README.md): Provisions IAM Execution Roles for AWS Step Functions State Machines and attaches execution policy ARNs.
