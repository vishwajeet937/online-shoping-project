terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
          }
  }
  backend "s3" {
    bucket =  "vish10-06-1998"
    key    = "node/npm/state"
    region = "ap-south-1"
  }
}
# Configure the AWS Provider
provider "aws" {
  region = var.provider_name
}

