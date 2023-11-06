resource "aws_s3_bucket" "example" {
  count       = length(var.s3_bucket_names)
  bucket      = var.s3_bucket_names[count.index]
  acl         = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.my_kms_key.key_id
      }
    }
  }
}

