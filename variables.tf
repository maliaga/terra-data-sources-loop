variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "subnet1_cidr" {
  type = list(string)
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
}

data "aws_availability_zones" "d_zone" {
  state = "available"
}