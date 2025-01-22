terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  # Configuration options .
  region     = "us-east-2"
  # access_key = ""
  # secret_key = ""
}
