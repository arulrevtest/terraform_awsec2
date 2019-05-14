variable "aws_region" {
    description = "EC2 Region for the VPC"
}

variable "aws_key_name" {
    description = "Kay pair name"
}

variable "az_zone" {
  type = "string"
}

variable "instance_types" {
  type = "map"
}

variable "amazon_linux_id" {}

variable "name" {
    description = "App name"
}

variable "ins_ami" {}

variable "vpc_cidr" {}

variable "private_subnet_cidr" {}

variable "public_subnet_id" {}

variable "private_subnet_id" {}

variable "vpc_id" {}