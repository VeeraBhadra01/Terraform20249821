resource "aws_instance" "tif-key" {
  ami           = "ami-00f251754ac5da7f0"
  instance_type = "t2.micro"
  key_name      = "aws_key"
  vpc_security_group_ids = [
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_https.id,
    aws_security_group.sg_http.id
  ]


  tags = {
    Name = "tif-key"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRsqksHaVHJnQdMtnERkMfQATkM64lZ9A0Hg9txH0ua16TQWjLRJCBu1tQoHkLpv1XF++dzxuJcuo2zHU/DKPYu/oJ0j7pZVhMNIdeaH2Iz2Xbuf9HL1fnquXOsEMxlhOPbnyaa8U1129tDPXqMNnvNXV+hNETH1RGCeXoXx8//JNUSFuYrF2/ZE9Ga81BGh3/Urg680lbDkWtXv2TpJYokupPcZfKAtBpM5tBVHMA9QpCXsodO9zSLZXB/C/yt3RgFRKJSYQSCbUrpWnKKBDT255hbs9OHsNeW9rp0TfRJaKwar67BUvFsHRh6dtOFO+OoxJFH6Hv9iKrZbfcAXIb+72Q8oG3pYlSFH0oTQwRkt06OYvoHdBkYZEzwKA5DCfodv6oAXLuTcfdFJ2oGi2BRT66p8YIdTrmWzLvXXKldQDrP9ku2pjWrxWNwKOGfhAuULPJrg35LbAuN8UU0gSe9e75aoE+9q+1eNMKHX03Sxiy5prKcg3jVnr/5ihJZ2BdnDpWRTxyznt112V8Rts16pBox+61PcivL9nK1UCAG+ypKgUpRNCitlH5zsbXqQZrbxRrfqWdW/O08RORC2SnKwUYslqvE4dqf2/8bB72Uwz3GOjtGy4DBLV7UZtx65yeYnq3pF6YgBvFjARIK/37pee5gVKxSaUpR9RFePE5pQ== bhadra9821@gmail.com"
}

resource "aws_security_group" "sg_ssh" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_https" {
  ingress {
    cidr_blocks = ["192.168.0.0/16"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_http" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}