# ZephyrCartOne Terraform Infrastructure

Infrastructure-as-Code (IaC) setup for the **ZephyrCartOne** e-commerce microservices platform.  
This repository provisions AWS cloud resources using **Terraform**, managing microservices infrastructure, IAM access controls, database tables, and workflow orchestration.

It pairs directly with the Java-based serverless codebase in [`zephyrcartone-lambda-app`](https://github.com/JeffJojerJonesCatulay/zephyrcartone-lambda-app).

---

## 🏗️ Architecture Overview

```mermaid
graph TD
    subgraph Clients & Orchestration
        SFN["AWS Step Functions (Order State Machine)"]
    end

    subgraph Service Layer (AWS Lambda)
        C_GET["Customer GET Lambda"]
        C_PUT["Customer PUT Lambda"]
        I_GET["Item GET Lambda"]
        I_PUT["Item PUT Lambda"]
        ORD["Ordering Lambda"]
    end

    subgraph Data Storage (Amazon DynamoDB)
        DDB_C[("Customer Table")]
        DDB_I[("Item Table")]
        DDB_O[("Ordering Table")]
    end

    SFN --> ORD
    C_GET --> DDB_C
    C_PUT --> DDB_C
    I_GET --> DDB_I
    I_PUT --> DDB_I
    ORD --> DDB_O
```

---

## 📁 Repository Structure

Below is the directory map of this repository with direct links to module and service documentation:

```
zephyrcartone-terraform/
├── README.md                              # Main repository README
└── dev/                                   # [Dev Environment Root](dev/README.md)
    ├── README.md                          # Dev environment overview & guide
    ├── backend/                           # [Remote State Backend](dev/backend/README.md)
    ├── customer/                          # [Customer Microservice](dev/customer/README.md)
    ├── item/                              # [Item Microservice](dev/item/README.md)
    ├── ordering/                          # [Ordering Microservice & Step Functions](dev/ordering/README.md)
    └── modules/                           # [Reusable Terraform Modules Library](dev/modules/README.md)
        ├── aws_dynamodb/                  # [AWS DynamoDB Table Module](dev/modules/aws_dynamodb/README.md)
        ├── aws_iam/                       # [AWS IAM Roles & Policies](dev/modules/aws_iam/README.md)
        │   ├── lambda/                    # [Lambda Execution Role Module](dev/modules/aws_iam/lambda/README.md)
        │   └── step_funtions/             # [Step Functions Execution Role Module](dev/modules/aws_iam/step_funtions/README.md)
        ├── aws_lambda/                    # [AWS Lambda Function Module](dev/modules/aws_lambda/README.md)
        └── aws_step_functiom/             # [AWS Step Functions Module](dev/modules/aws_step_functiom/README.md)
```

---

## 🚀 Quick Start Guide

### Prerequisites
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) `>= 1.0`
- [AWS CLI](https://aws.amazon.com/cli/) configured with valid IAM credentials
- Built application JAR artifacts from [`zephyrcartone-lambda-app`](https://github.com/JeffJojerJonesCatulay/zephyrcartone-lambda-app)

### Provisioning Order
1. **Initialize Remote Backend** (first-time deployment only):
   ```bash
   cd dev/backend
   terraform init
   terraform apply
   ```
2. **Deploy Customer Service**:
   ```bash
   cd dev/customer
   terraform init -backend-config=backend.hcl
   terraform apply
   ```
3. **Deploy Item Service**:
   ```bash
   cd dev/item
   terraform init -backend-config=backend.hcl
   terraform apply
   ```
4. **Deploy Ordering Service & Step Functions**:
   ```bash
   cd dev/ordering
   terraform init -backend-config=backend.hcl
   terraform apply
   ```

---

## 📝 Disclaimer
This repository is for educational and demonstration purposes. **ZephyrCartOne** is a dummy company, and the infrastructure defined here is designed for practice and portfolio presentation.