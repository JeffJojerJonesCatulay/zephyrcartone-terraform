variable "name" {
  type        = string
  description = "The name of the SFN role"
}

variable "policy_arns" {
  type        = list(string)
  description = "The list of policy ARNs"
}