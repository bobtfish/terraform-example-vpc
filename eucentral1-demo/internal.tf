module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami/ebs"
  region = "${var.region}"
  distribution = "trusty"
  instance_type = "t2.micro"
}

resource "aws_instance" "internal" {
    ami = "${module.ami.ami_id}"
    instance_type = "t2.micro"
    iam_instance_profile = "describe-instances"
    tags {
        Name = "internal-primary"
    }
    key_name = "${module.vpc.aws_key_name}"
    subnet_id = "${element(split(\",\", module.vpc.dedicatedsubnets), 0)}"
    private_ip = "${var.networkprefix}.10.4"
    security_groups = ["${module.vpc.security_group_allow_all}"]
    user_data = "${replace(file(\"${path.module}/internal.conf\"), \"__NETWORKPREFIX__\", \"${var.networkprefix}\")}"
}

