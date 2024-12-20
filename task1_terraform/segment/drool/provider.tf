provider "aws" {
  region = "ap-southeast-1"
  assume_role {
    role_arn = var.cross-account-assume_role_arn
  }
  default_tags {
    tags = {
      Project-code  = var.project_code
      Environment   = var.environment
      Zone          = var.zone
      Tier          = var.tier
      Agency-code   = var.agency_code
      Create-method = var.create_method
    }
  }
}

terraform {
  backend "s3" {
    region = "ap-southeast-1"
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  assume_role {
    role_arn = var.cross-account-assume_role_arn
  }
  default_tags {
    tags = {
      Project-code  = var.project_code
      Environment   = var.environment
      Zone          = var.zone
      Tier          = var.tier
      Agency-code   = var.agency_code
      Create-method = var.create_method
    }
  }
}