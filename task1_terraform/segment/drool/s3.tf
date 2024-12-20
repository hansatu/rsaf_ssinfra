module "cloudfrontlogs_s3" {
  source           = "../../modules/s3"
  create_bucket    = var.create_bucket
  environment      = var.environment
  agency_code      = var.agency_code
  create_method    = var.create_method
  project_code     = var.project_code
  tier             = var.tier
  zone             = var.zone
  function_name    = var.purpose
  kms_key          = var.s3_kms_key
  create_lifecycle = var.create_lifecycle
  s3_filename      = var.s3_policy_cloudfront_logs
  create_acl       = var.create_acl
  ownership        = var.ownership
  logging_enable   = var.logging_enable
  central_bucket   = var.central_bucket ## GCC Central logging bucket
  foldername       = var.foldername
  sse_algorithm    = var.sse_algorithm
}

module "cloudfront_static_site" {
  source           = "../../modules/s3"
  create_bucket    = var.create_bucket
  environment      = var.environment
  agency_code      = var.agency_code
  create_method    = var.create_method
  project_code     = var.project_code
  tier             = var.tier
  zone             = var.zone
  function_name    = var.cloudfront_static_site_name
  kms_key          = var.s3_kms_key
  create_lifecycle = var.create_lifecycle
  s3_filename      = var.s3_policy_cloudfront_static_site
  create_acl       = var.create_acl
  ownership        = var.ownership
  logging_enable   = var.logging_enable
  central_bucket   = var.central_bucket ## GCC Central logging bucket
  foldername       = var.foldername
  sse_algorithm    = var.sse_algorithm
}