resource "aws_security_group" "allow_http_ssh" {
  name   = "Allow_Pin_SSH_HTTP"
  vpc_id = aws_vpc.main1.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = -1
    protocol  = "icmp"
    to_port   = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}