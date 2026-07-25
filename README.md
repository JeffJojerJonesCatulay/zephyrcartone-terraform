# ZephyrCartOne Terraform

Infrastructure-as-Code setup for the dummy company **ZephyrCartOne**.  
This repository provisions AWS resources using **Terraform**, focusing on a production‑style deployment for demonstration and practice purposes. It complements the [`zephyrcartone-lambda-app`](https://github.com/JeffJojerJonesCatulay/zephyrcartone-lambda-app) project by managing the cloud infrastructure required to run it.

---

## 🚀 Overview
- **AWS Lambda**: Deploys the ordering system function.
- **IAM Roles**: Grants least‑privilege execution permissions.
- **DynamoDB**: Provides a backend table for storing orders.
- **Environment Variables**: Configurable via `.tfvars` or AWS Parameter Store to avoid hard‑coding values.

This is **not a real product or service** — it’s a mock project created for testing, learning, and showcasing Terraform workflows with AWS.

---

📝 Disclaimer
This repository is for educational and demonstration purposes only.
ZephyrCartOne is a dummy company and the infrastructure defined here is not intended for real production use.