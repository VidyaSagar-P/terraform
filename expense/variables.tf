variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "zone_id" {
    default = "Z09308032MS2P7RGMCTL9"
}

variable "domain_name" {
    default = "bavs.space"
}