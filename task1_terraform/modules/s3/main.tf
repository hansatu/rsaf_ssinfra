
data "aws_caller_identity" "current_account" {}

locals {
  account_id = data.aws_caller_identity.current_account.account_id
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "sst-s3-${var.agency_code}-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.function_name}"
  tags = {
    Name = "sst-s3-${var.agency_code}-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.function_name}"
    "zone" = var.zone
    "tier" = var.tier
    }
}
resource "aws_s3_bucket_acl" "s3_bucket" {
  count = var.create_acl ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = var.ownership
  }
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "config" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
      kms_master_key_id = var.kms_key
    }
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "versioning-bucket-config" {
  count = var.create_lifecycle ? 1 : 0
  depends_on = [aws_s3_bucket_versioning.versioning]

  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id = "config"
    noncurrent_version_expiration {
      noncurrent_days = var.expiration_days
    }
    status = "Enabled"
  }
}
resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  count = var.create_bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  policy  = templatefile("${("../../config/${var.foldername}/${var.s3_filename}")}", { 
    bucket_name = "sst-s3-${var.agency_code}-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.function_name}",
    account_id = local.account_id,
    env = "${var.environment}",
    zone = "${var.zone}",
    tier = "${var.tier}"
   })
  depends_on = [aws_s3_bucket_public_access_block.s3_bucket_public_access_block] # resource "aws_s3_bucket_policy" conflict with resource "aws_s3_bucket_public_access_block", bucket policy should be created after public_access_block.
}