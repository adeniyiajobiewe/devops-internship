terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  shared_credentials_files = ["C:/Users/adeni/.aws/credentials"]
}

resource "aws_instance" "my-ubuntu-server" {
  ami           = "ami-0ada6d94f396377f2"
  instance_type = var.instance_type

  tags = {
    Name = "Terraform Ubuntu 20.04 ec2 instance"
  }
}

variable "instance_type" {
    description = "t2.micro instance type"
    type = string
    default = "t2.micro"
}