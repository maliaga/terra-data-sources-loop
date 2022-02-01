resource "aws_route53_zone" "dev" {
  name = "dev.usuarioroot.com"
  vpc {
    vpc_id = aws_vpc.main1.id
  }
}