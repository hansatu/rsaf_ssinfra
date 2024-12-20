module "terraform_backend_s3" {
  source           = "../../modules/s3"
  environment      = var.environment
  agency_code      = var.agency_code
  create_method    = var.create_method
  create_acl       = var.create_acl
  project_code     = var.project_code
  tier             = var.tier
  zone             = var.zone
  function_name    = var.function_name
  s3_filename      = var.s3_filename
  foldername       = var.foldername
}