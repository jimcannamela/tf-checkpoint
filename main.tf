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

# Create aws_iam_role
resource "aws_iam_role" "jimc_ec2_role" {
  name = "jimc_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Create aws_iam_role_policy
resource "aws_iam_role_policy" "jimc_ec2_role_policy" {
  name = "jimc_ec2_role_policy"
  role = aws_iam_role.jimc_ec2_role.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:CreateBucket",
          "s3:DeleteBucket",
          "s3:ListAllMyBuckets"
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Create aws_iam_instance_profile
resource "aws_iam_instance_profile" "jimc_ec2_instance_profile" {
  name = "jimc_ec2_instance_profile"
  role = aws_iam_role.jimc_ec2_role.name
}

# aws_instance