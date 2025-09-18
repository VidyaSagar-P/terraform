variable "instance_names" {
  default = ["mysql", "backend", "frontend"]
}

# variable "zone_id" {
#   default = "Z09308032MS2P7RGMCTL9"
# }

variable "domain_name" {
  default = "bavs.space"
}


variable "environment" {
  default = "prod"
}