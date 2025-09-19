variable "instace_names" {
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "domain_name" {
  default = "bavs.space"
}

variable "zone_id" {
  default = "Z09308032MS2P7RGMCTL9"
}