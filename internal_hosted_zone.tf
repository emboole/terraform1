resource "aws_route53_zone" "private" {
  name = "cjove.internal"
  tags = {
    Name = var.tags_hz.private_zone_name #esto no deberia estar en tags
  }

  vpc {
    # vpc_id = aws_vpc.cjove.id
    vpc_id = module.vpc.vpc_id
  }
}

# i'm guessing that this is fruit
# resource "aws_vpc_dhcp_options" "cjove_dhcp" {
#   domain_name          = "cjove.internal"
#   domain_name_servers  = ["10.0.0.0", "10.0.1.0"] 

#   tags = {
#     Name = "cjove_dhcp"
#   }
# }