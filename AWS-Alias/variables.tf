variable "region" {
  description = "Region for praimary resources"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}



variable "ami_id" {
  description = "AMI ID for ec2 instances"
  type        = list(string)
  default     = ["ami-00f251754ac5da7f0", "ami-0d081196e3df05f4d"]
}

variable "instance_type" {
  description = "Insatance type for ec2"
  type        = string
  default     = "t2.micro"

}