resource "aws_instance" "server1" {
  ami                         = "ami-0b0af3577fe5e3532"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet1.id
  secondary_private_ips       = [aws_security_group.allow_http_ssh.id]
  associate_public_ip_address = true
  private_ip                  = "192.168.10.11"
  key_name                    = aws_key_pair.sample_key.id
  depends_on                  = [aws_internet_gateway.gw]
  user_data                   = file("userdata.sh")

  tags = {
    Name = "Server 1"
    Env = "dev"
  }
}

resource "aws_instance" "server2" {
  ami                         = "ami-0b0af3577fe5e3532"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet1.id
  secondary_private_ips       = [aws_security_group.allow_http_ssh.id]
  associate_public_ip_address = true
  private_ip                  = "192.168.10.12"
  key_name                    = aws_key_pair.sample_key.id
  depends_on                  = [aws_internet_gateway.gw]
  user_data                   = file("userdata.sh")

  tags = {
    Name = "Server 2"
    Env = "dev"
  }
}