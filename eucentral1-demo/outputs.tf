output "admin_key_name" {
  value = "${aws_key_pair.deployer.key_name}"
}
output "region" {
  value = "${var.region}"
}
output "account" {
  value = "${var.account}"
}
output "networkprefix" {
  value = "${var.networkprefix}"
}
output "azs" {
  value = "${module.vpc.azs}"
}
output "frontsubnets" {
  value = "${module.vpc.frontsubnets}"
}
output "dedicatedsubnets" {
    value = "${module.vpc.dedicatedsubnets}"
}
output "ephemeralsubnets" {
    value = "${module.vpc.ephemeralsubnets}"
}
output "public-routetable" {
    value = "${module.vpc.public-routetable}"
}
output "private-routetable" {
    value = "${module.vpc.private-routetable}"
}
output "id" {
    value = "${module.vpc.id}"
}
output "cidr_block" {
    value = "${module.vpc.cidr_block}"
}
output "main_route_table_id" {
    value = "${module.vpc.main_route_table_id}"
}
output "default_network_acl_id" {
    value = "${module.vpc.default_network_acl_id}"
}
output "default_security_group_id" {
    value = "${module.vpc.default_security_group_id}"
}
output "security_group_allow_all" {
    value = "${module.vpc.security_group_allow_all}"
}
output "nat_instances" {
    value = "${module.vpc.nat_instances}"
}
output "nat_public_ips" {
    value = "${module.vpc.nat_public_ips}"
}
output "nat_private_ips" {
    value = "${module.vpc.nat_private_ips}"
}

