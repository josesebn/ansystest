resource "aws_vpc" "ansystest_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "ansystest_vpc"
}
}

resource "aws_internet_gateway" "ansysigw" {
  vpc_id = aws_vpc.ansystest_vpc.id
  tags = {
    Name = "ansystest_igw"
}
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ansystest_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ansysigw.id
  }
  tags = {
    Name = "ansystest_pub_rt"
}
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_3_association" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.ansystest_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "ansystest_public_subnet_1"
}  
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.ansystest_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "ansystest_public_subnet_2"
}    
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.ansystest_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "ansystest_public_subnet_3"
}    
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.ansystest_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "ansystest_private_subnet_1"
}    
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.ansystest_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "ansystest_private_subnet_2"
}    
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.ansystest_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "ansystest_private_subnet_3"
}    
}