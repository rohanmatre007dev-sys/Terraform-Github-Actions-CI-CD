terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket         = "multi-tier-terraform-state-12345"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
