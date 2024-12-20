
#############
# Environment
#############

variable "environment" {
  description = "name of env"
  type        = string
}
variable "aws_region" {
  description = "Region name"
  type        = any
  default     = "ap-southeast-1"
}
variable "kms_key" {
  description = "kms key arn"
  type        = string
  default     = ""
}
variable "tier" {
  description = "tier name"
  type        = any
  default     = {}
}
variable "agency_code" {
  description = "agency code"
  type        = any
  default     = {}
}
variable "project_code" {
  description = "project code"
  type        = any
  default     = {}
}
variable "zone" {
  description = "zone name"
  type        = any
  default     = {}
}
variable "function_name" {
  description = "function name"
  type        = any
  default     = {}
}
variable "create_method" {
  description = "creation method"
  type        = any
  default     = {}
}

variable "central_bucket" {
  description = "central bucket ARN"
  type        = any
  default     = ""
}
variable "create_lifecycle" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = false
}

variable "create_bucket" {
  description = "Whether to create bucket or not?"
  type        = bool
  default     = true
}

variable "expiration_days" {
  description = "noncurrent_version_expiration_days"
  type        = number
  default     = "365"
}
variable "transitionIA_days" {
  description = "noncurrent_version_transitionIA_days"
  type        = number
  default     = "30"
}
variable "transitionGlacier_days" {
  description = "noncurrent_version_transitionGlacier_days"
  type        = number
  default     = "90"
}
variable "it-deeparchive" {
  description = "intelligent_tiering_deeparchive_days"
  type        = number
  default     = "180"
}
variable "it-archive" {
  description = "intelligent_tiering_archive_days"
  type        = number
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

variable "s3_filename" {
  description = "s3 access policy filename"
  type        = string
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = "aws:kms"
  
}

variable "kmskey_filename" {
  description = "kmskey policy filename"
  type        = string
  default     = ""
}

variable "create_acl" {
  description = "s3 policy filename"
  type        = bool
  default     = false
}
variable "ownership" {
  description = "object owner"
  type        = string
  default     = "BucketOwnerEnforced"
}
variable "create_newkmskey" {
  description = "If require to create new key"
  type        = bool
  default     = false
}
variable "logging_enable" {
  description = "If central logging need to enable"
  type        = bool
  default     = true
}
variable "foldername" {
  description = "folder name to get policy file"
  type        = string
}