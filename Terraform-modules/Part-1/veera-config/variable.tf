variable "cidr_block" {
  description = "Includes the Cidr_block value"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_vpc_name" {
  description = "Make a vpc name for uniq"
  type        = string
  default     = "Veera_VPC"
}