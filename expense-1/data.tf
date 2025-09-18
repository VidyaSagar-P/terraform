data "aws_ami" "ami_name" {
  most_recent = "true"
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}