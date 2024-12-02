provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "tfstatebuc"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-terraform-bucket-${random_id.bucket_id.hex}"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}