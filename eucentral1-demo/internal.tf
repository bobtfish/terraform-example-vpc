module "puppetmaster" {
  source = "github.com/terraform-community-modules/tf_aws_puppet/master"
  region = "${var.region}"
  instance_type = "t2.micro"
  iam_instance_profile = "describe-instances"
  aws_key_name = "${module.vpc.aws_key_name}"
  subnet_id = "${element(split(\",\", module.vpc.dedicatedsubnets), 0)}"
  security_group = "${module.vpc.security_group_allow_all}"
  repository = "https://github.com/bobtfish/terraform-puppet.git"
}

module "puppet-client" {
  source = "github.com/terraform-community-modules/tf_aws_puppet/agent"
  region = "${var.region}"
  instance_type = "t2.micro"
  iam_instance_profile = "describe-instances"
  aws_key_name = "${module.vpc.aws_key_name}"
  subnet_id = "${element(split(\",\", module.vpc.dedicatedsubnets), 0)}"
  security_group = "${module.vpc.security_group_allow_all}"
  puppetmaster_ip = "${module.puppetmaster.private_ip}"
}

