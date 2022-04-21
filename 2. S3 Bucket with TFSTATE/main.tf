terraform {
    backend "s3" {
        bucket  = var.bucket_name
        key     = "state/terraform.tfstate"
        # region  = "us-east-1"
        encrypt = true
        # si no pongo lo de abajo usa sse-s3 (aes-256) asi que no tengo que crear nada
        #kms_key_id = "THE_ID_OF_THE_KMS_KEY" 
    }
  }

resource "aws_s3_bucket" "bucketn" {
    bucket = var.bucket_name
    acl    = "private"

    versioning {
        enabled = true
    }

    tags = {
        Name = var.tags
    }
}