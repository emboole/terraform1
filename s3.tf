# terraform {
#     backend "s3" {
#     bucket  = "terraform-onboarding-bucketn-tfstate"
#     region  = "us-east-1"
#     key     = "state/terraform.tfstate"
#     encrypt = true
#     }
#   }

# resource "aws_s3_bucket" "bucketn" {
#     bucket = var.bucket_name
#     acl    = "private"

#     versioning {
#         enabled = true
#     }

#     tags = {
#         Name = var.bucket_tags
#     }
# }

resource "aws_s3_bucket" "bucket_asg" {
    bucket = var.bucket_asg_name
    acl    = "private"

    tags = {
        Name = "Pal ASG con un index.html"
    }
}

# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.us-east-1.s3"
}

# Archivo a subir al S3
resource "aws_s3_bucket_object" "file_upload" {
  bucket = "bucket_asg"
  key    = "index.html"
  source = "index.html"
}