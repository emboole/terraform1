variable "tags_hz" {
  type = map(string)
  description = "Resource tags"
  default = {
    vpc_name = "testn"
    private_zone_name = "hosted_testn"    
  }
}

variable "bucket_name" {
  type = string
  description = "Bucket name"
  default = "terraform-onboarding-bucketn-tfstate"
}

variable "bucket_tags" {
    type = string
    default = "backend-storing"
}