resource "aws_vpc" "environment-example-two"{
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags{
		Name = "terraform-aws-vpc-example-two"
	}
}


resource "aws_subnet" "subnet1"{
	cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}"
	vpc_id = "${aws_vpc.environment-example-two.id}"
	availability_zone = "us-west-2a"
}


resource "aws_subnet" "subnet2"{
	cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)}"
	vpc_id = "${aws_vpc.environment-example-two.id}"
	availability_zone = "us-west-2b"
}


resource "aws_security_group" "subnet-security"{
	vpc_id = "${aws_vpc.environment-example-two.id}"

	ingress{
		cidr_blocks = [
			"${aws_vpc.environment-example-two.cidr_block}"
		]

		from_port = 80
		to_port = 80
		protocol = "tcp"
	}
}


data "aws_ami" "ubuntu"{
	most_recent = true

	filter{
		name = "name",
		values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
	}

	filter{
		name = "virtualization-type",
		values = ["hvm"]
	}

	owners = ["099720109477"]
}


resource "aws_instance" "second-server"{
	ami = "${data.aws_ami.ubuntu.id}"
	instance_type = "t2.micro"

	tags{
		Name = "identify-instance-tag"
	}

	subnet_id = "${aws_subnet.subnet2.id}"
}
