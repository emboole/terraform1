resource "aws_s3_bucket" "bucket_asg" {
    bucket = var.bucket_asg_name
    acl    = "private"

    tags = {
        Name = "Pal ASG con un index.html"
    }
}

# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.nberne.id
  service_name = "com.amazonaws.us-east-1.s3"
}

# Archivo a subir al S3
resource "aws_s3_bucket_object" "file_upload" {
  bucket = var.bucket_asg_name
  key    = "index.html"
  source = "index.html"

  depends_on = [
    aws_s3_bucket.bucket_asg
  ]
}