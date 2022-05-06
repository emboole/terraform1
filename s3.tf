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

resource "aws_iam_role" "ec2_to_bucket_asg" {
  name                = "ec2_to_bucket_asg"
  assume_role_policy = data.aws_iam_policy_document.ec2_to_bucket_asg_policy_document.json
}

resource "aws_iam_instance_profile" "ec2_to_bucket" {
  name = "ec2_to_bucket"
  role = aws_iam_role.ec2_to_bucket_asg.name
}

# Policy con jsonencode (comentar si se usa la policy_document que es mejor)
# resource "aws_iam_policy" "ec2_to_bucket_asg_policy" {
#   name = "policy-381966"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = ["s3:GetObject", "s3:PutObject"],
#         Effect   = "Allow",
#         Resource = "${aws_s3_bucket.bucket_asg.arn}/*"
#       }],
#     Statement = [
#       {
#         Action   = ["s3:ListBucket"],
#         Effect   = "Allow",
#         Resource = "${aws_s3_bucket.bucket_asg.arn}"
#       },
#     ]
#   })
# }


# policy document
data "aws_iam_policy_document" "ec2_to_bucket_asg_policy_document" {
  statement {
    sid = "1"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.bucket_asg.arn}/*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.bucket_asg.arn}",
    ]
  }
}

# Aparentemente, no es necesario crear una policy si usas un policy_document y lo asignas al role
# resource "aws_iam_policy" "ec2_to_bucket_asg_policy" {
#   name   = "ec2_to_bucket_asg_policy"
#   path   = "/"
#   policy = data.aws_iam_policy_document.ec2_to_bucket_asg_policy_document.json
# }

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