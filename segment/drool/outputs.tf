
############## Cloudfront Output #########################
output "cloudfront_distribution_id" {
  description = "The identifier for the distribution."
  value       = element(concat(aws_cloudfront_distribution.this.*.id, [""]), 0)
}

output "cloudfront_distribution_arn" {
  description = "The ARN (Amazon Resource Name) for the distribution."
  value       = element(concat(aws_cloudfront_distribution.this.*.arn, [""]), 0)
}

output "cloudfront_distribution_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
  value       = element(concat(aws_cloudfront_distribution.this.*.caller_reference, [""]), 0)
}

output "cloudfront_distribution_status" {
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
  value       = element(concat(aws_cloudfront_distribution.this.*.status, [""]), 0)
}

output "cloudfront_distribution_trusted_signers" {
  description = "List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs"
  value       = element(concat(aws_cloudfront_distribution.this.*.trusted_signers, [""]), 0)
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = element(concat(aws_cloudfront_distribution.this.*.domain_name, [""]), 0)
}

output "cloudfront_distribution_last_modified_time" {
  description = "The date and time the distribution was last modified."
  value       = element(concat(aws_cloudfront_distribution.this.*.last_modified_time, [""]), 0)
}

output "cloudfront_distribution_in_progress_validation_batches" {
  description = "The number of invalidation batches currently in progress."
  value       = element(concat(aws_cloudfront_distribution.this.*.in_progress_validation_batches, [""]), 0)
}

output "cloudfront_distribution_etag" {
  description = "The current version of the distribution's information."
  value       = element(concat(aws_cloudfront_distribution.this.*.etag, [""]), 0)
}

output "cloudfront_distribution_hosted_zone_id" {
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to."
  value       = element(concat(aws_cloudfront_distribution.this.*.hosted_zone_id, [""]), 0)
}

output "cloudfront_origin_access_identities" {
  description = "The origin access identities created"
  value       = local.create_origin_access_identity ? { for k, v in aws_cloudfront_origin_access_identity.this : k => v } : {}
}

output "cloudfront_origin_access_identity_ids" {
  description = "The IDS of the origin access identities created"
  value       = local.create_origin_access_identity ? [for v in aws_cloudfront_origin_access_identity.this : v.id] : []
}

output "cloudfront_origin_access_identity_iam_arns" {
  description = "The IAM arns of the origin access identities created"
  value       = local.create_origin_access_identity ? [for v in aws_cloudfront_origin_access_identity.this : v.iam_arn] : []
}

output "cloudfront_monitoring_subscription_id" {
  description = " The ID of the CloudFront monitoring subscription, which corresponds to the `distribution_id`."
  value       = element(concat(aws_cloudfront_monitoring_subscription.this.*.id, [""]), 0)
}

output "cloudfront_distribution_tags" {
  description = "Tags of the distribution's"
  value       = element(concat(aws_cloudfront_distribution.this.*.tags_all, [""]), 0)
}

############### WAF ACL output #########################

output "web_acl_name" {
  description = "The name of the WAFv2 WebACL."
  value       = join("", aws_wafv2_web_acl.main.*.name)
}

output "web_acl_arn" {
  description = "The ARN of the WAFv2 WebACL."
  value       = join("", aws_wafv2_web_acl.main.*.arn)
}

output "web_acl_id" {
  description = "The ID of the WAFv2 WebACL."
  value       = join("", aws_wafv2_web_acl.main.*.id)
}

output "web_acl_capacity" {
  description = "The web ACL capacity units (WCUs) currently being used by this web ACL."
  value       = join("", aws_wafv2_web_acl.main.*.capacity)
}

output "web_acl_visibility_config_name" {
  description = "The web ACL visibility config name"
  value       = var.enabled ? aws_wafv2_web_acl.main[0].visibility_config[0].metric_name : ""
}

output "web_acl_rule_names" {
  description = "List of created rule names"
  value       = var.enabled ? join(", ", aws_wafv2_web_acl.main[0].rule.*.name) : ""
}

output "web_acl_assoc_id" {
  description = "The ID of the Web ACL Association"
  value       = try(aws_wafv2_web_acl_association.main[0].*.id, "")
}

output "web_acl_assoc_resource_arn" {
  description = "The ARN of the ALB attached to the Web ACL Association"
  value       = try(aws_wafv2_web_acl_association.main[0].*.resource_arn, "")
}

output "web_acl_assoc_acl_arn" {
  description = "The ARN of the Web ACL attached to the Web ACL Association"
  value       = try(aws_wafv2_web_acl_association.main[0].*.web_acl_arn, "")
}

output "web_acl_assoc_alb_list_id" {
  description = "The ID of the Web ACL Association for the alb_list resource"
  value       = try(join(", ", aws_wafv2_web_acl_association.alb_list[0].*.id), "")
}

output "web_acl_assoc_alb_list_resource_arn" {
  description = "The ARN of the ALB attached to the Web ACL Association for the alb_list resource"
  value       = try(join(", ", aws_wafv2_web_acl_association.alb_list[0].*.resource_arn), "")
}

output "web_acl_assoc_alb_list_acl_arn" {
  description = "The ARN of the Web ACL attached to the Web ACL Association for the alb_list resource"
  value       = try(join(", ", aws_wafv2_web_acl_association.alb_list[0].*.web_acl_arn), "")
}


/*
##### S3 logging Bucket output #####
output "bucket_name" {
  value       = aws_s3_bucket.s3_bucket.id
  description = "Bucket name"
}

output "bucket_arn" {
  value       = aws_s3_bucket.s3_bucket.arn
  description = "Bucket arn"
}

output "bucket_kms_arn" {
  value       = aws_kms_key.s3_kms_key.arn
  description = "KMS arn for Bucket"
}

################ S3 logs to Clouwdwatch ################

output "lambda_cloudwatch_log_group" {
  description = "CloudWatch Logs group used by the Lambda function."
  value       = aws_cloudwatch_log_group.lambda
}

output "logs_cloudwatch_log_group" {
  description = "CloudWatch Logs group storing the CloudFront logs."
  value       = aws_cloudwatch_log_group.logs
}

output "this_lambda_function" {
  description = "Lambda function used to forward CloudFront logs."
  value       = aws_lambda_function.this
}

output "this_s3_bucket" {
  description = "S3 Bucket storing CloudFront logs."
  value       = aws_s3_bucket.s3_bucket
}
*/

