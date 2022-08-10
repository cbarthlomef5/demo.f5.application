resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name_tag}_vpc-igw"
  }
}

resource "aws_subnet" "management-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}-management-a-sub"
  }
}

resource "aws_subnet" "management-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "${var.vpc_name_tag}-management-b-sub"
  }
}

resource "aws_subnet" "external-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}-external-a-sub"
  }
}

resource "aws_subnet" "external-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "${var.vpc_name_tag}-external-b-sub"
  }
}

resource "aws_subnet" "internal-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.5.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}-internal-a-sub"
  }
}

resource "aws_subnet" "internal-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.6.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "${var.vpc_name_tag}-internal-b-sub"
  }
}