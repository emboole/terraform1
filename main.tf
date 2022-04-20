terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_route53_zone" "private" {
  name = "testn.internal"
  tags = {
    Name = var.tags.private_zone_name
  }

  vpc {
    vpc_id = aws_vpc.testn.id
  }
}

resource "aws_vpc" "testn" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.tags.vpc_name
  }
}