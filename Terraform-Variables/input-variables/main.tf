terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "int-servers" {
  ami           = "ami-00f251754ac5da7f0"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}