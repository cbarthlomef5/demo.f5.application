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

resource "random_string" "unique_id" {
  length = 8
  special = false
  upper = false
}