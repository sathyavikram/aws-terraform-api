terraform {
  required_version = ">= 1.7.5"

  cloud {
    # Organization name you created in your terraform cloud account.
    # This is different for each account. Use same name you created in your account
    organization = "learn-and-create"
    workspaces {
      tags = ["aws-terraform-api"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.41.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}