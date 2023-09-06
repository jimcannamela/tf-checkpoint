terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

# Create an aws_s3_bucket
resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag
    Environment = "Dev"
  }
}

# Add an aws_s3_object (g-hello jar file)
resource "aws_s3_object" "object" {
    bucket = var.bucket_name
    key = var.target_file_name
    source = var.source_file_name
}

# aws_security_group
#   aws_default_vpc (optional, see aws_security_group hint for details)
# aws_iam_role_policy
# aws_iam_role
# aws_iam_instance_profile
# aws_instance