#Create VPC
resource "aws_vpc" "myVPC" {
  cidr_block           = "${var.vpc-cidr-block}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "${var.vpc-tagname}"
  }
}
