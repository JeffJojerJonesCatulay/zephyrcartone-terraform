# AWS DynamoDB Module (`dev/modules/aws_dynamodb`)

This module provisions an Amazon DynamoDB table with a single primary partition hash key.

---

## 📥 Inputs

| Name | Type | Description | Required |
| :--- | :--- | :--- | :---: |
| `dynamodb_table` | `string` | Name of the DynamoDB table | Yes |
| `billing_mode` | `string` | Billing mode (`PAY_PER_REQUEST` or `PROVISIONED`) | Yes |
| `hash_key` | `string` | Primary partition key attribute name | Yes |
| `attribute_types` | `string` | Attribute scalar type (`S` for String, `N` for Number, `B` for Binary) | Yes |

---

## 📤 Outputs

| Name | Description |
| :--- | :--- |
| `aws_dynamodb_table_arn` | The Amazon Resource Name (ARN) of the created DynamoDB table |

---

## 💻 Example Usage

```hcl
module "customer_table" {
  source          = "../modules/aws_dynamodb"
  dynamodb_table  = "CustomerTable"
  billing_mode    = "PAY_PER_REQUEST"
  hash_key        = "customerId"
  attribute_types = "S"
}
```
