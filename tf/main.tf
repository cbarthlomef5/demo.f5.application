resource "aws_secretsmanager_secret" "bigip-password" {
  name = "mySecretId"
}

resource "aws_secretsmanager_secret_version" "bigip-password" {
  secret_id     = aws_secretsmanager_secret.bigip-password.id
  secret_string = "BIGIP#Passw0rd"
}

resource "aws_key_pair" "demo" {
  key_name   = var.aws_key_pair_name
  public_key = file(lookup(var.aws_key_pair_file, "public"))
}

resource "aws_vpc" "security" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "security-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.security.id
  tags = {
    Name = "security-igw"
  }
}

resource "aws_route" "default" {
  route_table_id         = aws_vpc.security.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_subnet" "management-a" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "security-management-a-sub"
  }
}

resource "aws_subnet" "management-b" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "security-management-b-sub"
  }
}

resource "aws_subnet" "external-a" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "security-external-a-sub"
  }
}

resource "aws_subnet" "external-b" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = "10.1.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "security-external-b-sub"
  }
}

resource "aws_subnet" "internal-a" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = "10.1.5.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "security-internal-a-sub"
  }
}

resource "aws_subnet" "internal-b" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = "10.1.6.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "security-internal-b-sub"
  }
}
