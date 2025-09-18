locals {
  zone_id = "Z09308032MS2P7RGMCTL9"
  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
}
