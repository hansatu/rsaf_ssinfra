variable "agency_code" {
  type        = string
  description = "Provide the name of the agency code to be used"
}
variable "project_code" {
  type        = string
  description = "Provide the name of the project code to be used"
}
variable "environment" {
  type        = string
  description = "Provide the name of the environment to be used"
}
variable "zone" {
  type        = string
  description = "Provide the name of the zone"
}
variable "tier" {
  type        = string
  description = "Provide the name of the tier"
}
variable "function_name" {
  type        = string
  description = "Provide the name of the function name"
}
variable "create_method" {
  type        = string
  description = "Provide the name of the creation mathod"
}
variable "cross-account-assume_role_arn" {
  type = string
}

variable "create_distribution" {
  description = "Controls if CloudFront distribution should be created"
  type        = bool
  default     = true
}

variable "create_origin_access_identity" {
  description = "Controls if CloudFront origin access identity should be created"
  type        = bool
  default     = false
}

variable "origin_access_identities" {
  description = "Map of CloudFront origin access identities (value as a comment)"
  type        = map(string)
  default     = {}
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
  type        = list(string)
  default     = null
}

/*variable "comment" {
  description = "Any comments you want to include about the distribution."
  type        = string
  default     = null
}*/

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = null
}

/*variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = bool
  default     = true
}*/

variable "http_version" {
  description = "The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2."
  type        = string
  default     = "http2"
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution."
  type        = bool
  default     = null
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  type        = string
  default     = null
}

variable "retain_on_delete" {
  description = "Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards."
  type        = bool
  default     = false
}

variable "wait_for_deployment" {
  description = "If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this tofalse will skip the process."
  type        = bool
  default     = true
}

variable "web_acl_id" {
  description = "If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "origin" {
  description = "One or more origins for this distribution (multiples allowed)."
  type        = any
  default     = null
}

variable "origin_group" {
  description = "One or more origin_group for this distribution (multiples allowed)."
  type        = any
  default     = {}
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution"
  type        = any
  default = {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }
}

variable "geo_restriction" {
  description = "The restriction configuration for this distribution (geo_restrictions)"
  type        = any
  default     = {}
}

variable "logging_config" {
  description = "The logging configuration that controls how logs are written to your distribution (maximum one)."
  type        = any
  default     = {}
}

variable "custom_error_response" {
  description = "One or more custom error response elements"
  type        = any
  default     = {}
}

variable "default_cache_behavior" {
  description = "The default cache behavior for this distribution"
  type        = any
  default     = null
}

variable "ordered_cache_behavior" {
  description = "An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0."
  type        = any
  default     = []
}

variable "create_monitoring_subscription" {
  description = "If enabled, the resource for monitoring subscription will created."
  type        = bool
  default     = false
}

variable "realtime_metrics_subscription_status" {
  description = "A flag that indicates whether additional CloudWatch metrics are enabled for a given CloudFront distribution. Valid values are `Enabled` and `Disabled`."
  type        = string
  default     = "Enabled"
}

/*variable "waf_rules" {
  description = "Waf Rules"
  default     = []
  type = list(object({
    name              = string
    enabled           = bool
    priority          = string
    negated           = bool
    action_type       = string
    ranges            = list(map(string))
    byte_match_tuples = list(map(string))
    uri_match         = list(map(string))
  }))
}

variable "waf_acl_name" {
  description = "Waf Rules"
  type        = string
}

variable "waf_acl_default_action" {
  description = "WAF Default Action"
  type        = string
}*/

##########################################
######## Variables for WAF ACL ###########
##########################################

variable "enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = true
}

/*variable "name_prefix" {
  type        = string
  description = "Name prefix used to create resources."
}*/

variable "alb_arn" {
  type        = string
  description = "Application Load Balancer ARN"
  default     = ""
}

variable "alb_arn_list" {
  type        = list(string)
  description = "Application Load Balancer ARN list"
  default     = []
}

/*variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}*/

variable "rules" {
  description = "List of WAF rules."
  type        = any
  default     = []
}

variable "visibility_config" {
  description = "Visibility config for WAFv2 web acl. https://www.terraform.io/docs/providers/aws/r/wafv2_web_acl.html#visibility-configuration"
  type        = map(string)
  default     = {}
}

variable "create_alb_association" {
  type        = bool
  description = "Whether to create alb association with WAF web acl"
  default     = true
}

variable "create_logging_configuration" {
  type        = bool
  description = "Whether to create logging configuration in order start logging from a WAFv2 Web ACL to Amazon Kinesis Data Firehose."
  default     = false
}

variable "log_destination_configs" {
  type        = list(string)
  description = "The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want to associate with the web ACL. Currently, only 1 ARN is supported."
  default     = []
}

variable "redacted_fields" {
  description = "The parts of the request that you want to keep out of the logs. Up to 100 `redacted_fields` blocks are supported."
  type        = any
  default     = []
}

variable "allow_default_action" {
  type        = bool
  description = "Set to `true` for WAF to allow requests by default. Set to `false` for WAF to block requests by default."
  default     = true
}

variable "scope" {
  type        = string
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application. Valid values are CLOUDFRONT or REGIONAL. To work with CloudFront, you must also specify the region us-east-1 (N. Virginia) on the AWS provider."
  default     = "REGIONAL"
}

variable "logging_filter" {
  type        = any
  description = "A configuration block that specifies which web requests are kept in the logs and which are dropped. You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation."
  default     = {}
}

variable "description" {
  type        = string
  description = "A friendly description of the WebACL"
  default     = null
}

variable "custom_response_bodies" {
  type = list(object({
    key          = string
    content      = string
    content_type = string
  }))
  description = "Custom response bodies to be referenced on a per rule basis. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl#custom-response-body"
  default     = []
}

############# s3 bucket for logging ################
variable "create_bucket" {
  description = "whether to create bucket or not"
  type        = bool
  default     = true
}


variable "s3_kms_key" {
  description = "s3 kms key arn"
  type        = string
}
variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = "AES256"
}
variable "central_bucket" {
  description = "central bucket ARN"
  type        = any
  default     = {}
}
variable "create_lifecycle" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}
variable "expiration_days" {
  description = "noncurrent_version_expiration_days"
  default     = "365"
}
variable "transitionIA_days" {
  description = "noncurrent_version_transitionIA_days"
  default     = "30"
}
variable "transitionGlacier_days" {
  description = "noncurrent_version_transitionGlacier_days"
  default     = "90"
}
variable "it-deeparchive" {
  description = "intelligent_tiering_deeparchive_days"
  default     = "180"
}
variable "it-archive" {
  description = "intelligent_tiering_archive_days"
  default     = "125"
}
variable "create_intelligent_tiering" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = false
}
variable "create_notification" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = false
}
variable "lambda_notifications" {
  description = "Map of S3 bucket notifications to Lambda function"
  type        = any
  default     = {}
}
variable "sqs_notifications" {
  description = "Map of S3 bucket notifications to SQS queue"
  type        = any
  default     = {}
}
variable "sns_notifications" {
  description = "Map of S3 bucket notifications to SNS topic"
  type        = any
  default     = {}
}
variable "s3_policy_cloudfront_logs" {
  description = "s3 access policy filename for cloudfront logs"
  type        = string
}

variable "kmskey_filename" {
  description = "kmskey policy filename"
  type        = string
  default     = ""
}

variable "create_acl" {
  description = "Specify whether to create bucket ACL or not"
  type        = bool
  default     = false
}
variable "ownership" {
  description = "object owner"
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "logging_enable" {
  description = "If central logging need to enable"
  type        = bool
  default     = false
}
variable "foldername" {
  description = "folder name to get policy file"
  type        = string
}

variable "purpose" {
  description = "Specify the purpose for the s3 bucket"
  type        = string
}


############## S3 logs to Cloudwatch ###############
/*
variable "bucket_name" {
  description = "Name used for S3 Bucket resource."
  type        = string
} 

variable "name" {
  description = "Name used for resources."
  type        = string
} */

variable "retention" {
  description = "Retention in days for log files in S3 Bucket and CloudWatch Logs group."
  type        = number
  default     = 365
}
/*
variable "tags" {
  description = "Tags used for all created resources."
  type        = map(string)
  default     = {}
}*/

variable "create_origin_access_control" {
  description = "Controls if CloudFront origin access control should be created"
  type        = bool
  default     = false
}

variable "origin_access_control" {
  description = "Map of CloudFront origin access control"
  type = map(object({
    description      = string
    origin_type      = string
    signing_behavior = string
    signing_protocol = string
  }))

  default = {
    s3 = {
      description      = "CloudFront access to S3 error pages",
      origin_type      = "s3",
      signing_behavior = "always",
      signing_protocol = "sigv4"
    }
  }
}


variable "s3_policy_cloudfront_static_site" {
  description = "s3 access policy filename for drool static site"
  type        = string
}


variable "cloudfront_static_site_name" {
  description = "Specify the purpose for the s3 bucket"
  type        = string
}