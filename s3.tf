# terraform {
#     backend "s3" {
#     bucket  = "terraform-onboarding-bucketn-tfstate"
#     region  = "us-east-1"
#     key     = "state/terraform.tfstate"
#     encrypt = true
#     }
#   }

resource "aws_s3_bucket" "bucketn" {
    bucket = var.bucket_name
    acl    = "private"

    versioning {
        enabled = true
    }

    tags = {
        Name = var.bucket_tags
    }
}