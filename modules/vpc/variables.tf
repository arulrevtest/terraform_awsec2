
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
}

variable "enable_dns_support" {}

variable "enable_dns_hostnames" {}

variable "vpc_label" {}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
}

variable "aws_key_name" {
    description = "Kay pair name"
}

variable "nat-ami" {
    description = "NAT AMIs by region"
}