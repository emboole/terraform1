variable "tags_hz" {
  type = map(string)
  description = "Resource tags"
  default = {
    vpc_name = "cjove"
    private_zone_name = "hosted_cjove"    
  }
}

variable "bucket_name" {
  type = string
  description = "Bucket name"
  default = "terraform-onboarding-bucketn-tfstate"
}

variable "bucket_asg_name" {
  type = string
  description = "Bucket name"
  default = "terraform-onboarding-bucketn-asg"
}

variable "bucket_tags" {
    type = string
    default = "backend-storing"
}

variable "subnets_az" {
  type = map(string)
  description = "Subnet AZ"
  default = {
    az_1 = "us-east-1a"
    az_2 = "us-east-1b"    
  }
}

variable "subnets_tags" {
  type = map(string)
  description = "Subnet tags"
  default = {
    public = "Public Subnet"
    private = "Private Subnet"    
  }
}