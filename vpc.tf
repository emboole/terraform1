# /* VPC */
# resource "aws_vpc" "cjove" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"
#   enable_dns_hostnames = true # servira para resolver la zona dns?

#   tags = {
#     Name = var.tags_hz.vpc_name
#   }
# }

# # /* VPC Endpoints */

# resource "aws_vpc_endpoint" "s3" {
#   vpc_id       = aws_vpc.cjove.id
#   service_name = "com.amazonaws.us-east-1.s3"

#   tags = {
#     Environment = "S3 VPC Endpoint"
#   }
# }

# resource "aws_vpc_endpoint" "dynamodb" {
#   vpc_id       = aws_vpc.cjove.id
#   service_name = "com.amazonaws.us-east-1.dynamodb"

#   tags = {
#     Environment = "DynamoDB VPC Endpoint"
#   }
# }

# /* PUBLIC SUBNET & ASSOCIATIONS*/
# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.cjove.id
#   cidr_block = "10.0.0.0/24"
#   availability_zone = var.subnets_az.az_1

#   tags = {
#     Name = var.subnets_tags.public
#   }
# }

# resource "aws_route_table" "cjove_vpc_public_route_table" {
#     vpc_id = aws_vpc.cjove.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.cjove_igw.id
#     }

#     tags = {
#         Name = "Public Subnet Route Table."
#     }
# }

# resource "aws_route_table_association" "cjove_vpc_public_route_table_association" {
#     subnet_id = aws_subnet.public.id
#     route_table_id = aws_route_table.cjove_vpc_public_route_table.id
# }

# resource "aws_internet_gateway" "cjove_igw" {
#   vpc_id = aws_vpc.cjove.id

#   tags = {
#     Name = "Testn IGW"
#   }
# }

# /* PRIVATE SUBNET & ASSOCIATIONS*/
# resource "aws_subnet" "private" {
#   vpc_id     = aws_vpc.cjove.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = var.subnets_az.az_2

#   tags = {
#     Name = var.subnets_tags.private
#   }
# }

# /* Routing table for private subnet */
# resource "aws_route_table" "cjove_vpc_private_route_table" {
#   vpc_id = aws_vpc.cjove.id
#     tags = {
#         Name = "Private Subnet Route Table."
#     }
# }

# resource "aws_route_table_association" "cjove_vpc_privae_route_table_association" {
#     subnet_id = aws_subnet.private.id
#     route_table_id = aws_route_table.cjove_vpc_private_route_table.id
# }