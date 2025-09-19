
#Security Group creation
resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
  description = "cresting SG to allow SSH"

  #Inbound rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value["protocol"] #we can use . or []
      cidr_blocks      = ingress.value.cidr_blocks
      }
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

