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

# aws_s3_bucket

# aws_s3_object
# aws_security_group
#   aws_default_vpc (optional, see aws_security_group hint for details)
# aws_iam_role_policy
# aws_iam_role
# aws_iam_instance_profile
# aws_instance