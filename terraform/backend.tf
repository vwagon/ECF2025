terraform {
  backend "s3" {
    bucket         = "ecfete2025state"
    key            = "terraform/state/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    role_arn= "arn:aws:iam::619071338581:role/TerraformRole"
  }
}
