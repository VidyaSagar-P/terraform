#instance creation ec2
resource "aws_instance" "terraform" {

  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = "terraform"
  }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > private-ip.txt"
    }

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      #host = aws_instance.web.public_ip
      host = self.public_ip
  }
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [
            "sudo systemctl stop nginx"
        ]
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
  ingress {
    from_port        = 80
    to_port          = 80
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

