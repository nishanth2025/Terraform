resource "aws_subnet" "Public" {
	vpc_id = "${aws_vpc.terraform_vpc.id}"
	cidr_block = "10.0.0.0/28"
        availability_zone = "us-east-1a"
	tags = {
	    Name = "public_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  tags = {
    Name = "internet_gw"
  }
}

resource "aws_route_table" "route_table" {
 vpc_id = "${aws_vpc.terraform_vpc.id}"
  route {
	cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "public_route"
  }
}

resource "aws_route_table_association" "public_ass" {
  subnet_id = "${aws_subnet.Public.id}"
  route_table_id = "${aws_route_table.route_table.id}"
 }
