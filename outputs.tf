output "bucket_arn" {
    description = "ARN of created bucket"
    value       = aws_s3_bucket.s3bucket.arn
}

output "bucket_domain_name" {
    description = "Domain Name of created bucket"
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