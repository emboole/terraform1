# resource "aws_launch_template" "" {
#   name_prefix   = "ec2_nberne"
#   image_id      = "ami-0cff7528ff583bf9a"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_80.id, aws_security_group.allow_22.id]
#   iam_instance_profile {
#     name = aws_iam_instance_profile.ec2_to_bucket.name
#   }

#   user_data = filebase64("bootstraps/bootstrap.sh")
# }

resource "aws_launch_configuration" "ec2_nberne" {
  name            = "ec2_nberne"
  image_id        = "ami-0cff7528ff583bf9a"
  instance_type   = "t2.micro"
  security_groups =  [aws_security_group.allow_80.id, aws_security_group.allow_22.id]
  user_data       = filebase64("bootstraps/bootstrap.sh")
  key_name        = "nico_tickets"  
  iam_instance_profile = aws_iam_instance_profile.ec2_to_bucket.name

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = true  
}

resource "aws_autoscaling_group" "asg_nberne" {
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  vpc_zone_identifier = [aws_subnet.public.id]
  launch_configuration = aws_launch_configuration.ec2_nberne.name
}

resource "aws_security_group" "allow_80" {
  name        = "allow_80"
  description = "Allow 80 inbound traffic"
  vpc_id      = aws_vpc.nberne.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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

resource "aws_security_group" "allow_22" {
  name        = "allow_22"
  description = "Allow 22 inbound traffic"
  vpc_id      = aws_vpc.nberne.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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
    Name = "allow_22"
  }
}