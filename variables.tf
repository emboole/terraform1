variable "tags" {
  type = map(string)
  description = "Resource tags"
  default = {
    vpc_name = "testn"
    private_zone_name = "hosted_testn"    
  }
}