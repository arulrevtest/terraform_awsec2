aws_region = "eu-central-1"
aws_key_name = "terraform_instance_keypair"

vpc_cidr = "10.0.0.0/16"
vpc_label = "SharedServicesVPC"

public_subnet_cidr = "10.0.0.0/24"
private_subnet_cidr = "10.0.1.0/24"

enable_dns_support = true
enable_dns_hostnames = true

name = "Jira-Confluence"

azs = [ "eu-central-1a", "eu-central-1b", "eu-central-1c" ]

az_zone = "eu-central-1a"

ins_ami = "ami-7c412f13" # ubuntu 16.04 LTS

nat-ami = "ami-4a432d25"

amazon_linux_id = "ami-7c412f13"

email_address = "arul@virtusa.com"

instance_types = {
      web = "t2.small"
      app = "m4.large"
      bastion = "t2.small"
      nat = "t2.small"
      db = "m4.xlarge"
  }

apache-jira_sub_domain = "jirap.virtusa.com"
apache-confluence_sub_domain = "confluencep.virtusa.com"
jira-confluence_sub_domain = "jiraconfluencep.virtusa.com"
bastion_sub_domain = "bastionp.virtusa.com"
elb_sub_domain = "elbp.virtusa.com"

hosted_zone_id = "Z1JU2FGI591RYTU"
