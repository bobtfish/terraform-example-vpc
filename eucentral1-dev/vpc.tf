resource "aws_vpc" "main" {
    cidr_block = "10.84.0.0/16"
    enable_dns_support = false
    enable_dns_hostnames = false
    tags {
        Name = "eucentral1-devc"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "eucentral1-devc"
    }
}

resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "eucentral1 devc public"
    }
}

resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${yelpaws_instance.nat-primary.id}"
    }

    tags {
        Name = "eucentral1 devc public"
    }
}

resource "aws_main_route_table_association" "a" {
    vpc_id = "${aws_vpc.main.id}"
    route_table_id = "${aws_route_table.private.id}"
}

resource "aws_subnet" "front-primary" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.84.0.0/24"
    map_public_ip_on_launch = true
    availability_zone = "eu-central-1a"

    tags {
        Name = "primary az front dedicated"
    }
}

resource "aws_route_table_association" "front-primary" {
    subnet_id = "${aws_subnet.front-primary.id}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_subnet" "back-primary" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.84.1.0/24"
    availability_zone = "eu-central-1a"

    tags {
        Name = "primary az back dedicated"
    }
}

resource "aws_subnet" "front-secondary" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.84.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "eu-central-1b"

    tags {
        Name = "secondary az front dedicated"
    }
}

resource "aws_route_table_association" "front-secondary" {
    subnet_id = "${aws_subnet.front-secondary.id}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_subnet" "back-secondary" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.84.3.0/24"
    availability_zone = "eu-central-1b"

    tags {
        Name = "secondary az back dedicated"
    }
}

resource "aws_subnet" "ephemeral-primary" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.84.64.0/28"
    availability_zone = "eu-central-1a"

    tags {
        Name = "primary az back ephemeral"
    }
}

resource "aws_subnet" "ephemeral-secondary" {
  vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.84.128.0/28"
    availability_zone = "eu-central-1b"

    tags {
        Name = "secondary az back ephemeral"
    }
}

resource "aws_security_group" "allow_all" {
  name = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
      from_port = 0
      to_port = 65535
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yelpaws_instance" "nat-primary" {
    instance_type = "m1.small"
    tags {
        Name = "nat-primary"
    }
    ubuntu = "lucid"
    subnet_id = "${aws_subnet.front-primary.id}"
    security_groups = ["${aws_security_group.allow_all.id}"]
    tags {
        Name = "nat-primary"
        owner = "tdoran@yelp.com"
        creator = "tdoran"
        "puppet:role::aws_nat" = ""
    }
}

resource "yelpaws_instance" "nat-secondary" {
    instance_type = "m1.small"
    tags {
        Name = "nat-secondary"
    }
    ubuntu = "lucid"
    subnet_id = "${aws_subnet.front-secondary.id}"
    security_groups = ["${aws_security_group.allow_all.id}"]
    tags {
        Name = "nat-secondary"
        owner = "tdoran@yelp.com"
        creator = "tdoran"
        "puppet:role::aws_nat" = ""
    }
}

