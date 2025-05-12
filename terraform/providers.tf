provider "aws" {
  region = var.AWS_REGION # Région principale : Paris
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"  # pour CloudWatch Billing uniquement
}