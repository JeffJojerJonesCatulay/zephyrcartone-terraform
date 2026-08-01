# AWS IAM Step Functions Role Module (`dev/modules/aws_iam/step_funtions`)

This module provisions an IAM execution role for AWS Step Functions (`states.amazonaws.com`) and attaches a set of specified IAM policy ARNs via `for_each`.

---

## 📥 Inputs

| Name | Type | Description | Required |
| :--- | :--- | :--- | :---: |
| `name` | `string` | Name of the Step Functions IAM role | Yes |
| `policy_arns` | `list(string)` | List of policy ARNs to attach to the role | Yes |

---

## 📤 Outputs

| Name | Description |
| :--- | :--- |
| `sfn_role` | The ARN of the created IAM Step Functions role |

---

## 💻 Example Usage

```hcl
module "aws_iam_step_functions_role" {
  source      = "../modules/aws_iam/step_funtions"
  name        = "ordering_sfn_role"
  policy_arns = [
    "arn:aws:iam::aws:policy/AWSStepFunctionsFullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  ]
}
```
