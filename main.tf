resource "aws_vpc" "development_sample_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "development-vpc"
  }
}

resource "aws_subnet" "development_sample_public_subnet" {
  vpc_id                  = aws_vpc.development_sample_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "development-public-subnet"
  }
}

resource "aws_internet_gateway" "development_sample_internet_gateway" {
  vpc_id = aws_vpc.development_sample_vpc.id

  tags = {
    Name = "development-internet-gateway"
  }
}

resource "aws_route_table" "development_sample_route_table" {
  vpc_id = aws_vpc.development_sample_vpc.id

  tags = {
    Name = "development-route-table"
  }
}

resource "aws_route" "development_sample_route" {
  route_table_id         = aws_route_table.development_sample_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.development_sample_internet_gateway.id
}

resource "aws_route_table_association" "development_sample_table_association" {
  subnet_id      = aws_subnet.development_sample_public_subnet.id
  route_table_id = aws_route_table.development_sample_route_table.id
}

resource "aws_security_group" "development_sample_security_group" {
  name   = "development_sample_security_group"
  vpc_id = aws_vpc.development_sample_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/32"] // Place your IP here
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}