output "apache_public_dns" {
  value = "${aws_instance.apache.public_dns}"
}
output "jiraconfluence_private_dns" {
  value = "${aws_instance.jiraconfluence.private_dns}"
}
output "bastion_public_dns" {
  value = "${aws_instance.bastion.public_dns}"
}
output "elb_dns_name" {
  value = "${aws_elb.elb.dns_name}"
}
output "elb_zone_id" {
  value = "${aws_elb.elb.zone_id}"
}



