terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Or the latest version you prefer
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Configure the AWS region using a variable
  access_key = "***"
  secret_key = "***"
}
