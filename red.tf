resource "aws_vpc" "main1" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name     = "VPC Main"
    Location = "US"
  }
}

resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.main1.id
  count             = length(data.aws_availability_zones.d_zone.names)
  cidr_block        = element(var.subnet1_cidr, count.index)
  availability_zone = element(data.aws_availability_zones.d_zone.names, count.index)
  tags              = {
    Name = "Subnet ${count.index + 1} on ${element(data.aws_availability_zones.d_zone.names, count.index )}"
  }
}