variable "bucket_name" {
  type = string
  description = "Bucket name"
  default = "terraform-onboarding-bucketn-tfstate"
}

variable "tags" {
    type = string
    default = "backend-storing"
}