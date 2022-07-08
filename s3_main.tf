resource "aws_s3_bucket" "source_bucket" {
  bucket_prefix   = "${var.business_divsion}-${var.environment}-source-bucket-"
  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "source_bucket_acl" {
  bucket = aws_s3_bucket.source_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "source_bkt_versioning" {
  bucket = aws_s3_bucket.source_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "source_lc" {
  bucket = aws_s3_bucket.source_bucket.id
  depends_on = [aws_s3_bucket_versioning.source_bkt_versioning]
  rule {
    id      = "transition"
    status = "Enabled"

    filter {
      prefix = var.environment
    }

    transition {
      days          = var.source_bkt_SC_standard_ia
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = var.source_bkt_SC_Intelligent_tier
      storage_class = "INTELLIGENT_TIERING"
    }
    transition {
      days          = var.source_bkt_SC_glacier
      storage_class = "GLACIER"
    }
    expiration {
      days = var.source_bkt_SC_expiration
    }
    noncurrent_version_expiration {
      noncurrent_days = var.source_bkt_SC_non_c_expiration
    }
  }
}

resource "aws_s3_bucket_replication_configuration" "source_bkt_replication" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.destination_bkt_versioning]

  role   = aws_iam_role.s3_replication.arn
  bucket = aws_s3_bucket.source_bucket.id

  rule {
    id = "${var.business_divsion}-${var.environment}"

    filter {
      prefix = var.environment
    }

    status = "Enabled"

    delete_marker_replication {
      status = "Enabled"
      }

    destination {
      bucket        = aws_s3_bucket.destination_bucket.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket_prefix   = "${var.business_divsion}-${var.environment}-dest-bucket-"
  tags = local.common_tags
  provider = aws.region2
}

resource "aws_s3_bucket_versioning" "destination_bkt_versioning" {
  provider = aws.region2
  bucket = aws_s3_bucket.destination_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "dest_bucket_acl" {
  provider = aws.region2
  bucket = aws_s3_bucket.destination_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_lifecycle_configuration" "destination_lc" {
  provider = aws.region2
  bucket = aws_s3_bucket.destination_bucket.id
  depends_on = [aws_s3_bucket_versioning.destination_bkt_versioning]
  rule {
    id      = "transition"
    status = "Enabled"
    filter {
      prefix = var.environment
    }
    transition {
      days          = var.dest_bkt_SC_standard_ia
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = var.dest_bkt_SC_Intelligent_tier
      storage_class = "INTELLIGENT_TIERING"
    }
    transition {
      days          = var.dest_bkt_SC_glacier
      storage_class = "GLACIER"
    }
    expiration {
      days = var.dest_bkt_SC_expiration
    }
    noncurrent_version_expiration {
      noncurrent_days = var.dest_bkt_SC_non_c_expiration
    }
  }
}

resource "aws_s3_bucket_replication_configuration" "dest_bkt_replication" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.source_bkt_versioning]
  provider = aws.region2
  role   = aws_iam_role.s3_replication.arn
  bucket = aws_s3_bucket.destination_bucket.id
  rule {
    id = "${var.business_divsion}-${var.environment}"

    filter {
      prefix = var.environment
    }

    status = "Enabled"

    delete_marker_replication {
      status = "Enabled"
      }

    destination {
      bucket        = aws_s3_bucket.source_bucket.arn
      storage_class = "STANDARD"
    }
  }
}

