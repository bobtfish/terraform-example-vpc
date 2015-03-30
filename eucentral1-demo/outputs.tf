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
output "primary-az" {
  value = "${module.vpc.primary-az}"
}
output "secondary-az" {
  value = "${module.vpc.secondary-az}"
}
output "primary-az-frontsubnet" {
  value = "${module.vpc.primary-az-frontsubnet}"
}
output "primary-az-dedicatedsubnet" {
    value = "${module.vpc.primary-az-dedicatedsubnet}"
}
output "primary-az-ephemeralsubnet" {
    value = "${module.vpc.primary-az-ephemeralsubnet}"
}
output "secondary-az-frontsubnet" {
    value = "${module.vpc.secondary-az-frontsubnet}"
}
output "secondary-az-dedicatedsubnet" {
    value = "${module.vpc.secondary-az-dedicatedsubnet}"
}
output "secondary-az-ephemeralsubnet" {
    value = "${module.vpc.secondary-az-ephemeralsubnet}"
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
output "nat_instance" {
    value = "${module.vpc.nat_instance}"
}
output "nat_public_ip" {
    value = "${module.vpc.nat_public_ip}"
}
output "nat_private_ip" {
    value = "${module.vpc.nat_private_ip}"
}

