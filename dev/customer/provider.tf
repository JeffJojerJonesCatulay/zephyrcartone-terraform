provider "aws" {
  region = var.provider_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration is managed by backend.hcl
  # terraform init -backend-config=backend.hcl
  backend "s3" {}
}