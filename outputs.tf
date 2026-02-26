output "alb_dns_name" {
  value = module.alb.lb_dns_name
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}

output "rds_endpoint" {
  value     = module.rds.db_instance_endpoint
  sensitive = true
}

output "s3_bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}
