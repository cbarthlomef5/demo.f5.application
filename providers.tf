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
    bigip = {
      source = "F5Networks/bigip"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  shared_config_files      = ["/home/ec2-user/.aws/config"]
  shared_credentials_files = ["/home/ec2-user/.aws/credentials"]
  profile                  = "default"
  
  default_tags {
    tags = {
      Application = "CFE Public to Private Converstion"
    }
  }
}

provider "bigip" {
  address  = "10.10.1.11"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.bigip_pw_secret_current_version.secret_string
}