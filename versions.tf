
terraform {
  required_version = ">= 0.12.19"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3"
    }
  }
}
