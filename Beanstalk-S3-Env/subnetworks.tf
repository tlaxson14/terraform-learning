#Create internet gateway
resource "aws_internet_gateway" "myIGW" {
  vpc_id = "${aws_vpc.myVPC.id}"

  tags {
    Name = "${var.igw-tagname}"
  }
}

#Create route table
resource "aws_route_table" "myRT" {
  vpc_id = "${aws_vpc.myVPC.id}"

  route {
    cidr_block = "${var.route1-cidr}"
    gateway_id = "${aws_internet_gateway.myIGW.id}"
  }

  tags {
    Name = "${var.route-table-tagname}"
  }
}
