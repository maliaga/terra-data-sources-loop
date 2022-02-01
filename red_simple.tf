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
  vpc_id            = aws_vpc.main1.id
  cidr_block        = "192.168.10.0/24"
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Subnet 1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.main1.id
  cidr_block        = "192.168.20.0/24"
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Subnet 2"
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id            = aws_vpc.main1.id
  cidr_block        = "192.168.30.0/24"
  availability_zone = "us-east-1c"
  tags              = {
    Name = "Subnet 3"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main1.id

  tags = {
    Name = "GW VPC Main"
  }
}
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.main1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags   = {
    Name = "Public Subnet RT"
  }
}
resource "aws_route_table_association" "public-subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.web-rt.id
}
resource "aws_route_table_association" "public-subnet2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.web-rt.id
}
resource "aws_route_table_association" "public-subnet3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.web-rt.id
}