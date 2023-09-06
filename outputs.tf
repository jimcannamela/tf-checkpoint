output "bucket_arn" {
    description = "S3 Bucket ARN"
    value       = aws_s3_bucket.s3bucket.arn
}

output "bucket_domain_name" {
    description = "S3 Bucket Domain Name"
    value       = aws_s3_bucket.s3bucket.bucket_domain_name
}

output "object_id" {
    description = "Object Id"
    value = aws_s3_object.object.id
}

output "object_key" {
    description = "Object key"
    value = aws_s3_object.object.key
}

output "vpc_id" {
    description = "VPC id"
    value = aws_default_vpc.default.id
}

output "security_group_arn" {
    description = "Security Group ARN"
    value = aws_security_group.allowsshandhttp.arn
}

output "security_group_id" {
    description = "Security Group id"
    value = aws_security_group.allowsshandhttp.id
}

output "iam_role_id" {
    description = "IAM Role id"
    value = aws_iam_role.jimc_ec2_role.id
}

output "iam_role_policy_id" {
    description = "IAM Role Policy id"
    value = aws_iam_role_policy.jimc_ec2_role_policy.id  
}

output "iam_instance_profile_id" {
    description = "IAM Instance Profile id"
    value = aws_iam_instance_profile.jimc_ec2_instance_profile.id
} 

