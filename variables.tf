variable "aws_region" {
    description = "EC2 Region for the VPC"
}

variable "vpc_cidr" {
    type = "string"
}

variable "enable_dns_support" {
    type = "string"
}

variable "enable_dns_hostnames" {
    type = "string"
}

variable "vpc_label"{}

variable "aws_key_name" {
    description = "Kay pair name"
}

variable "ins_ami" {
    description = "AMIs by region"
}

variable "nat-ami" {
    description = "NAT AMIs by region"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
}

variable "name" {
    description = "App name"
}

variable "az_zone" {
  type = "string"
}

variable "amazon_linux_id" {}

#variable "instance_profile_id" {}

variable "email_address" {
    description = "Email Address"
}

variable "instance_types" {
  type = "map"
}

variable "apache-jira_sub_domain" {}
variable "apache-confluence_sub_domain" {}
variable "jira-confluence_sub_domain" {}
variable "bastion_sub_domain" {}
variable "elb_sub_domain" {}

variable "hosted_zone_id" {
   type = "string"
}

