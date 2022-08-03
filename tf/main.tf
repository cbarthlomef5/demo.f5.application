terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.2.0"
    }
  }
}

provider "http" {}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

resource "random_id" "unique_id" {
  byte_length = "8"
}

resource "aws_secretsmanager_secret" "bigip-password" {
  name = "mySecretId"
}

resource "aws_secretsmanager_secret_version" "bigip-password" {
  secret_id     = aws_secretsmanager_secret.bigip-password.id
  secret_string = "BIGIP#Passw0rd"
}

resource "aws_key_pair" "udf" {
  key_name   = var.aws_key_pair_name
  public_key = file(var.aws_key_pair_file)
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

data "http" "f5-cftv2-failover-existing-network" {
  url = "https://raw.githubusercontent.com/F5Networks/f5-aws-cloudformation-v2/main/examples/failover/failover-existing-network.yaml"
}

resource "aws_cloudformation_stack" "network" {
  name         = "networking-stack"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM"]
  disable_rollback = "true"
  parameters = {
    uniqueString             = "f5demo-${random_id.unique_id.hex}"
    vpcId                    = aws_vpc.security.id
    bigIpMgmtSubnetId01      = aws_subnet.management-a.id
    bigIpMgmtSubnetId02      = aws_subnet.management-b.id
    bigIpExternalSubnetId01  = aws_subnet.external-a.id
    bigIpExternalSubnetId02  = aws_subnet.external-b.id
    bigIpInternalSubnetId01  = aws_subnet.internal-a.id
    bigIpInternalSubnetId02  = aws_subnet.internal-b.id
    bigIpMgmtAddress01       = "10.1.1.11"
    bigIpMgmtAddress02       = "10.1.2.11"
    bigIpExternalSelfIp01    = "10.1.3.11"
    bigIpExternalSelfIp02    = "10.1.4.11"
    bigIpInternalSelfIp01    = "10.1.5.11"
    bigIpInternalSelfIp02    = "10.1.6.11"
    bigIpExternalVip01       = "10.1.5.12"
    bigIpExternalVip02       = "10.1.6.12"
    bigIpPeerAddr            = "10.1.1.11"
    restrictedSrcAddressMgmt = "10.1.0.0/16"
    restrictedSrcAddressApp  = "0.0.0.0/0"
    provisionPublicIpMgmt    = "false"
    secretArn                = aws_secretsmanager_secret.bigip-password.arn
    sshKey                   = "udf"
    cfeS3Bucket              = "f5demo-${random_id.unique_id.hex}-bigip-high-availability-solution"
  }

  template_body = data.http.f5-cftv2-failover-existing-network.response_body
}


