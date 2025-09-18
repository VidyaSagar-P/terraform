#instance creation ec2
resource "aws_instance" "terraform" {
    count = length(var.instance_name)
    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_name[count.index]
        }
    )
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

    tags = merge(
        var.common_tags,
        {
            Name = "allow_ssh"
        }
    )

}

