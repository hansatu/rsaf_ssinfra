######## PROJECT TAGS ########

variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "project_code" {
  type    = string
  default = "slp"
}

variable "agency_code" {
  type    = string
  default = "hdb"
}

variable "environment" {
  type        = string
  description = <<EOT
    (Optional)  The name of the environment where the resources will be deployed.
 
    Options:
      - dev
      - uat
      - stg
      - prd
      - dso
      - mgt
 
    Default: uat
  EOT

  default = "uat"
}

variable "tier" {
  type = string
}

variable "zone" {
  type = string
}

variable "cross_account_assume_role_arn" {
  type = string
  default = ""
}

variable "create_method" {
  type    = string
  default = "iac-terraform"
}

variable "create_acl" {
  description = "create_acl"
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
  default     = false
}
variable "foldername" {
  description = "folder name to get policy file"
  type        = string
}

variable "s3_filename" {
  description = "s3 access policy filename"
  type        = string
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

variable "s3_kms_key" {
  description = "kms key arn"
  type        = string
  default     = ""
}

variable "function_name" {
  description = ""
  type        = string
}
