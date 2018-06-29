#Create Subnet1
resource "aws_subnet" "foobarSubnet1" {
  vpc_id                  = "${aws_vpc.foobar-example.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags {
    Name = "foobarSubnet1"
  }
}


#Create Subnet2
resource "aws_subnet" "foobarSubnet2" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = "${aws_vpc.foobar-example.id}"
  availability_zone = "us-west-2b"

  tags {
    Name = "foobarSubnet2"
  }
}


#Create Internet Gateway
resource "aws_internet_gateway" "foobar-GW" {
  vpc_id = "${aws_vpc.foobar-example.id}"

  tags {
    name = "Foobar-IGW"
  }
}


#Create route table
resource "aws_route_table" "foobar-Route-Table" {
  vpc_id = "${aws_vpc.foobar-example.id}"

  tags {
    Name = "foobar-Route-Table"
  }
}


#Create internet access link from RT to IGW
resource "aws_route" "internet-access-foobar" {
  route_table_id         = "${aws_route_table.foobar-Route-Table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.foobar-GW.id}"
}


#Connect Route table with Subnet1
resource "aws_route_table_association" "foobar-RT-Association" {
  subnet_id      = "${aws_subnet.foobarSubnet1.id}"
  route_table_id = "${aws_route_table.foobar-Route-Table.id}"
}


#Create security group and attach ingress traffic
resource "aws_security_group" "foo-security-group" {
  vpc_id      = "${aws_vpc.foobar-example.id}"
  name        = "foobar-Security-Group"
  description = "The foobar SG"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  tags {
    Name = "My foobar SG"
  }
}

#Create NACL with port traffic
resource "aws_network_acl" "foobar-NACL" {
  vpc_id     = "${aws_vpc.foobar-example.id}"
  subnet_ids = ["${aws_subnet.foobarSubnet1.id}"]

  #Allow port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  #Allow ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  #Egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags {
    Name = "foobar-NACL"
  }
}
