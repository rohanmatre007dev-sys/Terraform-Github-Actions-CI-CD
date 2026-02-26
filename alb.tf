module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = "multi-tier-alb"

  load_balancer_type = "application"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets

  security_groups = [aws_security_group.alb_sg.id]

  target_groups = [
    {
      name_prefix      = "front"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        ec2 = {
          target_id = module.ec2_instance.id
          port      = 80
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = var.environment
  }
}
