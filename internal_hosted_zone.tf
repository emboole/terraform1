resource "aws_route53_zone" "private" {
  name = "nberne.internal"
  tags = {
    Name = var.tags_hz.private_zone_name #esto no deberia estar en tags
  }

  vpc {
    # vpc_id = aws_vpc.nberne.id
    vpc_id = module.vpc.vpc_id
  }
}

# i'm guessing that this is fruit
# resource "aws_vpc_dhcp_options" "nberne_dhcp" {
#   domain_name          = "nberne.internal"
#   domain_name_servers  = ["10.0.0.0", "10.0.1.0"] 

#   tags = {
#     Name = "nberne_dhcp"
#   }
# }