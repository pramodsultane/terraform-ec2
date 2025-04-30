variable "region" {
  type    = string
  default = "ap-south-1" # Default AWS region (India)
  description = "The AWS region to deploy to"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
  description = "The instance type for the EC2 instance"
}

variable "ami" {
  type    = string
  default = "ami-0e35ddab05955cf57" # Default Amazon Linux 2 AMI in ap-south-1 (as of April 2025)
  description = "The AMI ID to use for the EC2 instance"
}

variable "security_group_name" {
  type    = string
  default = "terraform-sg"
  description = "The name for the security group"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
  description = "CIDR block for the subnet"
}

variable "instance_name" {
  type    = string
  default = "default"
  description = "The name tag for the EC2 instance"
}
