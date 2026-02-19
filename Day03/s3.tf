terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "us-east-1"
}

#create s3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "yashraj-gohil-bucket-012"

  tags = {
    Name        = "Demo_bucket"
    Environment = "Dev"
  }
}
