provider "aws" {
  region = "eu-central-1"
}

/*
    Create VPC
*/

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "${var.vpc_cidr}"
    enable_dns_support = "${var.enable_dns_support}"
    enable_dns_hostnames = "${var.enable_dns_hostnames}"
    vpc_label = "${var.vpc_label}"
    public_subnet_cidr = "${var.public_subnet_cidr}"
    private_subnet_cidr = "${var.private_subnet_cidr}"
    aws_key_name = "${var.aws_key_name}"
    nat-ami = "${var.nat-ami}"
}

module "ec2" {
    source = "./modules/ec2"
    aws_region = "${var.aws_region}"
    aws_key_name = "${var.aws_key_name}"
    az_zone = "${var.az_zone}"
    instance_types = "${var.instance_types}"
    amazon_linux_id = "${var.amazon_linux_id}"
    name = "${var.name}"
    public_subnet_id = "${module.vpc.public_subnets}"
    private_subnet_id = "${module.vpc.private_subnets}"
    vpc_id = "${module.vpc.vpc_id}"
    vpc_cidr = "${module.vpc.vpc_cidr}"
    ins_ami = "${var.ins_ami}"
    private_subnet_cidr = "${var.private_subnet_cidr}"
}


module "route53" {
	source = "./modules/dns"
	zone_id = "${var.hosted_zone_id}"
	apache-jira_sub_domain = "${var.apache-jira_sub_domain}"
    apache-confluence_sub_domain = "${var.apache-confluence_sub_domain}"
    jira-confluence_sub_domain = "${var.jira-confluence_sub_domain}"
    bastion_sub_domain = "${var.bastion_sub_domain}"
    elb_sub_domain = "${var.elb_sub_domain}"
	apache_public_dns = "${module.ec2.apache_public_dns}"
	jiraconfluence_private_dns = "${module.ec2.jiraconfluence_private_dns}"
	bastion_public_dns = "${module.ec2.bastion_public_dns}"
	elb_dns_name = "${module.ec2.elb_dns_name}"
	elb_zone_id = "${module.ec2.elb_zone_id}"
	vpc_cidr = "${module.vpc.vpc_cidr}"
}