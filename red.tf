resource "aws_vpc" "main1" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name     = "VPC Main"
    Location = "US"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = var.subnet1_cidr
  vpc_id     = aws_vpc.main1.id

  tags = {
    Name = "Subnet 1"
  }
}