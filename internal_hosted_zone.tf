# resource "aws_route53_zone" "private" {
#   name = "testn.internal"
#   tags = {
#     Name = var.tags_hz.private_zone_name
#   }

#   vpc {
#     vpc_id = aws_vpc.testn.id
#   }
# }

# resource "aws_vpc" "testn" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = var.tags_hz.vpc_name
#   }
# }