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
    key    = var.target_file_name
    source = var.source_file_name
}

# Set aws_default_vpc (optional, see aws_security_group hint for details)
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Create aws_security_group
resource "aws_security_group" "allowsshandhttp" {
    name        = "allow_ssh_and_http"
    description = "Allow SSH and HTTP inbound traffic"
    vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_and_http"
  }

}

# aws_iam_role_policy
# aws_iam_role
# aws_iam_instance_profile
# aws_instance