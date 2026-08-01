# Terraform Remote Backend (`dev/backend`)

This stack provisions the foundational AWS infrastructure required to store and lock Terraform state files for the `dev` environment.

---

## 📦 Provisioned Resources

1. **Amazon S3 Bucket** (`aws_s3_bucket.tf_state`): Stores `.tfstate` files remotely.
2. **Amazon DynamoDB Table** (`aws_dynamodb_table.tf_locks`): Provides state locking via `LockID` hash key to prevent concurrent state modifications.

---

## ⚙️ Input Variables

| Name | Type | Description | Default / Example |
| :--- | :--- | :--- | :--- |
| `bucket_name` | `string` | Name of the S3 state storage bucket | `"zephyrcartone-tf-state"` |
| `lock_table_name` | `string` | Name of the DynamoDB state locking table | `"zephyrcartone-tf-locks"` |
| `billing_mode` | `string` | DynamoDB billing mode (`PAY_PER_REQUEST` or `PROVISIONED`) | `"PAY_PER_REQUEST"` |
| `hash_key` | `string` | Partition key attribute name | `"LockID"` |
| `hash_key_type` | `string` | Attribute type (`S`, `N`, `B`) | `"S"` |

---

## 🚀 Execution Instructions

Run this stack locally before deploying any microservices:

```bash
# Navigate to backend directory
cd dev/backend

# Initialize Terraform
terraform init

# Apply infrastructure
terraform apply
```
