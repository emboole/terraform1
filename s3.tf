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

resource "aws_s3_bucket" "bucket_asg" {
    bucket = var.bucket_asg_name
    acl    = "private"

    # al pedo
    # versioning {
    #     enabled = true
    # }

    tags = {
        Name = "Pal ASG con un index.html"
    }
}

resource "aws_s3_bucket_object" "file_upload" {
  bucket = "bucket_asg"
  key    = "index.html"
  source = "index.html"
#   etag   = "${filemd5("${path.module}/my_files.zip")}"
}