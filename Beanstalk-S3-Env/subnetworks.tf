#Create internet gateway
resource "aws_internet_gateway" "myIGW" {
  vpc_id = "${aws_vpc.myVPC.id}"

  tags {
    name = "${var.igw-tagname}"
  }
}

#Create route table
resource "aws_route_table" "myRT" {
  vpc_id = "${aws_vpc.myVPC.id}"

  tags {
    name = "${var.route-table-tagname}"
  }
}

#Create public subnet in us-east-1
resource "aws_subnet" "myPublicSubnet" {
  vpc_id                  = "${aws_vpc.myVPC.id}"
  cidr_block              = "${var.public-subnet-cidr}"
  availability_zone       = "${var.public-subnet1-az}"
  map_public_ip_on_launch = true

  tags {
    name = "${var.public-subnet1-tagname}"
  }
}
