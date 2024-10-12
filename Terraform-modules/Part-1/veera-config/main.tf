provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.aws_vpc_name
  }
}

module "webserver-Veera" {
  source     = "../modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block
  ami        = "ami-00f251754ac5da7f0"
  # Remember, select an AMI that exists in your AWS region.
  # If in doubt, use the AMI above and the us-east-1 region.
  instance_type  = "t2.micro"
  webserver_name = "Veera"
}