module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.4.0"

  identifier = "multitierdb"

  engine               = "mysql"
  engine_version       = "8.0"
  major_engine_version = "8.0"
  family               = "mysql8.0"

  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "mydb"
  username = "admin"
  password = var.db_password

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  publicly_accessible = false
  storage_encrypted   = true
  multi_az            = false

  skip_final_snapshot = true
}
