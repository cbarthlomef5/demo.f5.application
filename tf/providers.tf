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