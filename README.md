# terraform-example-vpc

You need [my fork](https://github.com/bobtfish/terraform) of [terraform](https://www.terraform.io/) and
[the aws cli tool](http://aws.amazon.com/cli/) installed, with a [~/.aws/credentials file](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files) with a _[demo]_ section

This repository builds an example VPC with front and back networks + different routing tables and
a NAT instance with terraform.

For more information, see [my blog post](http://bobtfish.github.io/blog/2015/03/29/terraform-from-the-ground-up/) about it.

## Quickstart - running it

    make
    ssh-add id_rsa
    cd eucentral1-demo
    make
    terraform apply
    make sshnat
    ssh 10.1.1.4

## See also

  * https://github.com/bobtfish/terraform-vpc-nat
  * https://github.com/bobtfish/terraform-vpc
  * https://github.com/bobtfish/terraform-azs
  * https://github.com/bobtfish/terraform-ubuntu-ami

