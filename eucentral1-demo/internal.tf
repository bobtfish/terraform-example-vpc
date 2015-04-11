module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.region}"
  distribution = "trusty"
  architecture = "amd64"
  virttype = "hvm"
  storagetype = "instance-store"
}

resource "aws_instance" "internal" {
    ami = "${module.ami.ami_id}"
    instance_type = "t2.micro"
    tags {
        Name = "internal-primary"
    }
    key_name = "${module.vpc.aws_key_name}"
    subnet_id = "${element(split(\",\", module.vpc.dedicatedsubnets), 0)}"
    private_ip = "${var.networkprefix}.10.4"
    security_groups = ["${module.vpc.security_group_allow_all}"]
    user_data = "#cloud-config\napt_sources:\n - source: \"deb https://get.docker.io/ubuntu docker main\"\n   keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9\n - source: \"deb http://apt.puppetlabs.com trusty main\"\n   keyid: 1054b7a24bd6ec30\napt_upgrade: true\nlocale: en_US.UTF-8\npackages:\n - lxc-docker\n - puppet\n - git\nruncmd:\n - [ /usr/bin/docker, run, -d, --name, consul, -p, \"8500:8500\", -p, \"8600:8600/udp\", fhalim/consul ]\n - [ /usr/bin/docker, run, --rm, -v, \"/usr/local/bin:/target\", jpetazzo/nsenter ]\n"
}

