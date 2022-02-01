#resource "aws_vpc" "main1" {
#  cidr_block           = var.vpc_cidr
#  instance_tenancy     = "default"
#  enable_dns_hostnames = "true"
#
#  tags = {
#    Name     = "VPC Main"
#    Location = "US"
#  }
#}
#
#resource "aws_subnet" "subnets" {
#  vpc_id            = aws_vpc.main1.id
#  count             = length(data.aws_availability_zones.d_zone.names)
#  cidr_block        = element(var.subnet1_cidr, count.index)
#  availability_zone = element(data.aws_availability_zones.d_zone.names, count.index)
#  tags              = {
#    Name = "Subnet ${count.index + 1} on ${element(data.aws_availability_zones.d_zone.names, count.index )}"
#  }
#}
#
#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.main1.id
#
#  tags = {
#    Name = "GW VPC Main"
#  }
#}
#resource "aws_route_table" "web-rt" {
#  vpc_id = aws_vpc.main1.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.gw.id
#  }
#  tags   = {
#    Name = "Public Subnet RT"
#  }
#}
#resource "aws_route_table_association" "public-subnet" {
#  count     = length(var.subnet1_cidr)
#  route_table_id = aws_route_table.web-rt.id
#  subnet_id = element(aws_subnet.subnets.*.id, count.index)
#}