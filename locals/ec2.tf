resource "aws_instance" "expense_instances" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_name.id
  instance_type          = var.instance_names[count.index] == "frontend" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}

#Security Group creation
resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh"
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


resource "aws_instance" "test_local_exp" {
  ami = data.aws_ami.ami_name.id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = "locals"
  }
}