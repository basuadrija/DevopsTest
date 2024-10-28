provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "testec2" {
    instance_type = "t2.micro"
    ami = "ami-06b21ccaeff8cd686"
    key_name = "Terraformnew"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    
     tags = {
       Name = "TerraformEc2Instance"
     }
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-06388416af6cd9c5e"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}