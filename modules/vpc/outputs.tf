output "nat_eips" {
  value = "${aws_eip.nat.public_ip}"
}

output "private_route_table" {
  value = "${aws_route_table.private_routetable.id}"
}

output "public_route_table" {
  value = "${aws_route_table.public_routetable.id}"
}

output "public_subnets" {
  value = "${aws_subnet.public_subnet_a.id}"
}

output "private_subnets" {
  value = "${aws_subnet.private_subnet_a.id}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

