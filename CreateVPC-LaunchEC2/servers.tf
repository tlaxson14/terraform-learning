data "aws_ami" "ubuntu"{
	most_recent = true

	filter{
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
	}

	filter{
		name = "virtualization-type"
		values = ["hvm"]
	}

	owners = ["099720109477"]

}

#Provision EC2 instance
resource "aws_instance" "aws-terraform-fooserver"{
	ami = "${data.aws_ami.ubuntu.id}"
	instance_type = "t2.micro"
	subnet_id = "${aws_subnet.foobarSubnet1.id}"
	key_name = "new-keypair"
	depends_on = ["aws_internet_gateway.foobar-GW"]
	associate_public_ip_address = true
	vpc_security_group_ids = ["${aws_security_group.foo-security-group.id}"]

	tags{
		Name = "Hello_VPC_World!"
	}
}
