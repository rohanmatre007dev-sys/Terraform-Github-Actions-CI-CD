module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "frontend-instance"

  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2023 (Mumbai)
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              EOF

  tags = {
    Environment = var.environment
  }
}
