output "s3_bucket_id" {
  value       = try(aws_s3_bucket.s3_bucket.id, "")
  description = "Bucket name"
}

output "bucket_arn" {
  value       = try(aws_s3_bucket.s3_bucket.arn, "")
  description = "Bucket arn"
}

output "bucket_domain_name" {
  value       = try(aws_s3_bucket.s3_bucket.bucket_domain_name, "")
  description = "Bucket domain name"
}

output "bucket_regional_domain_name" {
  value = try(aws_s3_bucket.s3_bucket.bucket_regional_domain_name, "")
  description  = "Bucket Regional domain name"
}