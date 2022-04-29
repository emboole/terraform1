resource "aws_launch_template" "ec2_testn" {
  name_prefix   = "ec2_testn"
  image_id      = "ami-0f9fc25dd2506cf6d"
  instance_type = "t2.micro"
  security_group_names = [aws_security_group.allow_80.name]
}

resource "aws_autoscaling_group" "asg_testn" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.ec2_testn.id
    version = "$Latest"
  }
}

resource "aws_security_group" "allow_80" {
  name        = "allow_80"
  description = "Allow 80 inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
    # cidr_blocks      = [module.vpc.cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_80"
  }
}