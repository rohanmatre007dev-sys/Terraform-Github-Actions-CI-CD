variable "region" {
  default = "ap-south-1"
}

variable "environment" {
  default = "dev"
}

variable "db_password" {
  description = "RDS password"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}
