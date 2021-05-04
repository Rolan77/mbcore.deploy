variable "aws_region" {
  description = "Region for the VPC"
  type = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type = string
  default = "192.168.1.0/24"
}

variable "ami" {
  description = "Ubuntu 20.04"
  type = string
  default = "ami-0767046d1677be5a0"
}
