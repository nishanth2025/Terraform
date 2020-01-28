resource "aws_vpc" "terraform_vpc" {
	cidr_block = "10.0.0.0/26"
	instance_tenancy = "dedicated"
   tags = {
	Name = "custom-vpc"
  }
}
