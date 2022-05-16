resource "aws_iam_role" "ec2_role" {
  name                = "ec2_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_instance_profile" "ec2_to_bucket" {
  name = "ec2_to_bucket"
  role = aws_iam_role.ec2_role.name
}

# policy document
data "aws_iam_policy_document" "ec2_policy_document" {
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

# Policy document para asumir rol
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "ec2_policy"{
    name = "ec2_policy"
    policy = data.aws_iam_policy_document.ec2_policy_document.json
}

resource "aws_iam_role_policy_attachment" "ec2_policy_role" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}