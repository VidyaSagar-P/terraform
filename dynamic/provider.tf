terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.13.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-remote-state-vidya"
    key            = "dynamic-remote-state"
    region         = "us-east-1"
    dynamodb_table = "terraform-locking-file"
  }
}

provider "aws" {
  region = "us-east-1"
}
 