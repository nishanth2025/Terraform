resource "aws_instance" "pub-ser" {
  ami = "ami-03587fa4048e9eb92"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.Public.id}"
   tags = {
	Name = "public_ins" 
  }
}
