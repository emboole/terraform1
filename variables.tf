variable "tags" {
  type = list(object({
    vpc_name = string
    private_zone_name = string
  }))
  default = [
    {
      vpc_name = "testn"
      private_zone_name = "hosted_testn"
    }
  ]
}