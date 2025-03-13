terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0"
    }
  }
  
}
provider "aws" {
  region = var.AWS_REGION
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}