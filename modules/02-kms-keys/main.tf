## 02. KMS Key Creation:

# 1.Creating KMS key for ebs:


resource "aws_kms_key" "kms_key1" {
  description = var.kmskey_ebs_name
  tags        = merge(var.tags, {
    Name = var.kmskey_ebs_name
  })
}

resource "aws_kms_alias" "kms_aliases1" {
  name         = "alias/${var.kmskey_ebs_name}"
  target_key_id = aws_kms_key.kms_key1.key_id
}


# 2. Creating KMS key for s3:

resource "aws_kms_key" "kms_key2" {
  description = var.kmskey_s3_name
  tags        = merge(var.tags, {
    Name = var.kmskey_s3_name
  })
}

resource "aws_kms_alias" "kms_aliases2" {
  name         = "alias/${var.kmskey_s3_name}"
  target_key_id = aws_kms_key.kms_key2.key_id
}






