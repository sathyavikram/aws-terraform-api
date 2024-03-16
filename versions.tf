terraform {
  required_version = ">= 1.7.5"

  cloud {
    ## same organization name created in terraform cloud account
    organization = "learn-and-create"
    workspaces {
      tags = ["aws-terraform-api"]
    }
  }
}