module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.4.0"

  identifier = "multitierdb"

  engine               = "mysql"
  engine_version       = "8.0.36"
  major_engine_version = "8.0"
  family               = "mysql8.0"

  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "mydb"
  username = "admin"
  password = var.db_password

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_ids             = module.vpc.private_subnets

  skip_final_snapshot = true
}
