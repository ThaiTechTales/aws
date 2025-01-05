resource "aws_lb" "alb-dev-apse2-01" {
  name               = "alb-dev-apse2-01"
  internal           = false # Set to true if the load balancer is internal (for example, in a VPC)
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  tags = {
    Name = "alb-dev-apse2-01"
  }
}



resource "aws_lb_target_group" "alb-tg-dev-apse2-01" {
  name     = "alb-tg-dev-apse2-01"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "alb-tg-dev-apse2-01"
  }
}

resource "aws_lb_listener" "alb_listener-dev-apse2-01" {
  load_balancer_arn = aws_lb.alb-dev-apse2-01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg-dev-apse2-01.arn
  }
}

resource "aws_lb_target_group_attachment" "app_tg_attachment-dev-apse2-01" {
  target_group_arn = aws_lb_target_group.alb-tg-dev-apse2-01.arn
  target_id        = var.instance_id
  port             = 80
}