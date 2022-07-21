module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

#   name = "nberne"
  cidr = "10.0.0.0/16"

  azs             = [var.subnets_az.az_1, var.subnets_az.az_2]
  private_subnets = ["10.0.0.0/24"]
  public_subnets  = ["10.0.1.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
}