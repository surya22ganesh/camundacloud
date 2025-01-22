resource "aws_vpc" "camunda_vpc" {
  
  cidr_block           = "11.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "camunda_vpc"
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.camunda_vpc.id
  tags = {
    Name = "Camunda_IGW"
  }
}

resource "aws_subnet" "vpc_pub_sub1_us_east_2a" {
  vpc_id                  = aws_vpc.camunda_vpc.id
  cidr_block              = "11.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub_sub1_us_east_2a"
  }
}

resource "aws_subnet" "vpc_pub_sub2_us_east_2b" {
  vpc_id                  = aws_vpc.camunda_vpc.id
  cidr_block              = "11.0.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub_sub1_us_east_2b"
  }
}

resource "aws_route_table" "vpc_pub_sub1_rt" {
  vpc_id = aws_vpc.camunda_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "pub_sub1_us_east_2a_RT"
  }
}

resource "aws_route_table_association" "vpc_pub_sub1_rt_assoc" {
  subnet_id      = aws_subnet.vpc_pub_sub1_us_east_2a.id
  route_table_id = aws_route_table.vpc_pub_sub1_rt.id
}

resource "aws_route_table_association" "vpc_pub_sub2_rt_assoc" {
  subnet_id      = aws_subnet.vpc_pub_sub2_us_east_2b.id
  route_table_id = aws_route_table.vpc_pub_sub1_rt.id
}

resource "aws_security_group" "camunda_vpc_sg" {
  name        = "camunda_vpc_sg"
  description = "Allow All inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.camunda_vpc.id

  tags = {
    Name = "camunda_vpc_sg_All_Traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.camunda_vpc_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.camunda_vpc_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}