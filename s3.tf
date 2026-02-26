module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"

  bucket = "multi-tier-assets-${var.environment}-12345"

  versioning = {
    enabled = true
  }

  tags = {
    Environment = var.environment
  }
}
