#instance creation ec2
resource "aws_instance" "terraform" {

    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = var.environments == "prod" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = "terraform"
    }
}


#Security Group creation
resource "aws_security_group" "allow_ssh_terraform"{
    name = "allow_ssh"
    description = "cresting SG to allow SSH"

    #Inbound rules
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   #Outbound rules 
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name = "allow_ssh"
    }

}

