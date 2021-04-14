resource "aws_lb" "public" {
  name               = "${var.PROJECT_NAME}-${var.ENV}-public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_alb_public.id]
  subnets            = data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNETS

  tags = {
    Name              = "public-${var.PROJECT_NAME}${var.ENV}-public-alb"
    Environment       = var.ENV
  }
}

//security grp
resource "aws_security_group" "allow_alb_public" {
  name                  = "allow-public-ami-sg"
  description           = "allow-public-ami-sg"
  vpc_id                = data.terraform_remote_state.vpc.outputs.VPC_ID


ingress {
description           = "HTTP"
from_port             = 80
to_port               = 80
protocol              = "tcp"
cidr_blocks           = ["0.0.0.0/0"] // allow internet
}

egress {
from_port             = 0
to_port               = 0
protocol              = "-1"
cidr_blocks           = ["0.0.0.0/0"]
}

tags = {
Name                  = "allow-public-ami-sg"
}
}