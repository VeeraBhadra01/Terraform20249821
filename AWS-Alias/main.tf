terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }

  required_version = "> 1.2.0"
}

## The first provider is shown in the normal manner.
provider "aws" {
  region = var.region[0]
}

## The second provider uses an alias. "oregon" is the alias for "us-west-2"
provider "aws" {
  alias  = "oregon"
  region = var.region[1]
}

## Create an instance the way you normally would in the us-east-2 region. 
## This will be Debian Linux running in Ohio (us-east-2).

resource "aws_instance" "test_instance" {
  ami           = var.ami_id[0]
  instance_type = var.instance_type

  tags = {
    Name = "NV TEST INSTANCE! Destroy me when done !"
  }
}

## Later, resources can be created in the second region by  
## using the alias: aws.oregon
## This will be Amazon Linux running in Oregon (us-west-2). Note the different ami for the region (free tier eligible)

resource "aws_instance" "oregon_instance" {
  provider      = aws.oregon
  ami           = var.ami_id[1]
  instance_type = var.instance_type
  tags = {
    Name = "OREGON TEST INSTANCE! DESTROY ME WHEN DONE!!"
  }


}