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
  
  # Configuration SSO obligatoire
  assume_role {
    role_arn     = "arn:aws:iam::418295686252:role/TerraformRole"
    session_name = "terraform-session"
  }
  
  # Spécification du profil SSO
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "studiuser"
}
