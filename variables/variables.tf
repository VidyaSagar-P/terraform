variable "ami_id" {
  type        = string
  default     = "ami-0b09ffb6d8b58ca91"
  description = "it is a default ami id"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tags" {
    type = map
    default = {
        Name = "backend"
        project = "expense"
        component = "backend"
        environment = "DEV"
        terraform = "true"
    }
}

variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_decription" {
    default = "allow ssh port 22"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}