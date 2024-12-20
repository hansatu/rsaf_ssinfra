provider "aws" {
  region = "ap-southeast-1"
  assume_role {
     role_arn = var.cross_account_assume_role_arn
   }
  default_tags {
    tags = {
      project-code  = var.project_code
      environment   = var.environment
      zone          = var.zone
      tier          = var.tier
      agency-code   = var.agency_code
      create-method = var.create_method
    }
  }
}

data "aws_partition" "current" {}

data "aws_region" "current" {}


# backend config and provider versions
terraform {
  required_version = ">= 1.5.7"

  backend "s3" {
  region = "ap-southeast-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.41.0"
    }
  }
}