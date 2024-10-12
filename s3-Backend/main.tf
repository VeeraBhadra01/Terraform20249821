terraform {
  backend "s3" {
    bucket = "veerabucket982"
    key    = "dir1/key"
    region = "ap-south-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user_tif" {
  name = "user-tif"
  tags = {
    department = "DEVOPS"
  }
}