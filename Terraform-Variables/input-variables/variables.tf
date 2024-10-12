variable "instance_type" {
  description = "specified instance type for ec2"
  type        = string
}

variable "instance_name" {
  description = "Name for ec2 instance"
  type        = string
}

variable "region" {
  description = "Selecting region for ec2 instance"
  type        = string
  default     = "us-east-1"
}