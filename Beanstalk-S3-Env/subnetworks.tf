#Create internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = "${var.vpc-tagname}"

    tags {
      name = "${var.igw-tagname}"
    }
}
