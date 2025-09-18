output "terraform_pub_ip"{
    value = aws_instance.terraform.public_ip
    sensitive = false
    description = "terraform instance public IP"
}