terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region                   = var.AWS_DEFAULT_REGION
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.AWS_PROFILE
}
