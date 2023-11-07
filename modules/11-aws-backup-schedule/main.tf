#10. Module To Create Aws Backup Configuration for Weekly, Monthly, Yearly:

resource "aws_kms_key" "backup_key" {
  description      = "kms key for backup"
  enable_key_rotation = true

}

resource "aws_kms_alias" "awsbackup_alias" {
  name          = "alias/awsbackupkey-encryption"
  target_key_id = aws_kms_key.backup_key.key_id
}



# 1. Create an IAM role for AWS Backup
resource "aws_iam_role" "backup_role" {
  name = "iamr_awsbackup"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

# 2. Attach required IAM policies to the role
resource "aws_iam_policy_attachment" "backup_policy_attachment1" {
  name  = "iamr_awsbackup"
  roles = [aws_iam_role.backup_role.name]

  # Attach each policy individually
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "backup_policy_attachment2" {
  name  = "iamr_awsbackup"
  roles = [aws_iam_role.backup_role.name]

  # Attach each policy individually
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_iam_policy_attachment" "backup_policy_attachment3" {
  name  = "iamr_awsbackup"
  roles = [aws_iam_role.backup_role.name]

  # Attach each policy individually
  policy_arn =  "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"

}

resource "aws_iam_policy_attachment" "backup_policy_attachment4" {
  name  = "iamr_awsbackup"
  roles = [aws_iam_role.backup_role.name]

  # Attach each policy individually
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupFullAccess"

}


# 3. Create an AWS Backup Vault

resource "aws_backup_vault" "awsbackup_vault" {
  name        = "awsbackup_vault"
  kms_key_arn = aws_kms_key.backup_key.arn
}



resource "aws_backup_plan" "backup_plan" {
  name = "awsbackup_plan"
  rule {
    rule_name         = "backup-daily-rule"
    target_vault_name = aws_backup_vault.awsbackup_vault.name
    schedule          = "cron(0 14 ? * MON-FRI,SAT *)" # Daily  at 2:00 PM SGT
    completion_window = 120
    lifecycle {
      delete_after = 15
    }
  }

  rule {
    rule_name         = "backup-weekly-rule"
    target_vault_name = aws_backup_vault.awsbackup_vault.name
    schedule          = "cron(0 14 ? * SUN *)" # Weekly on Sundays at 2:00 PM SGT
    completion_window = 120
    lifecycle {
      delete_after = 35
    }
  }

  rule {
    rule_name         = "backup-monthly-rule"
    target_vault_name = aws_backup_vault.awsbackup_vault.name
    schedule          = "cron(0 17 28 * ? *)" # Monthly on day 28 at 5:00 PM SGT
    completion_window = 120
    lifecycle {
      delete_after = 390
    }
  }
  rule {
    rule_name         = "backup-yearly-rule"
    target_vault_name = aws_backup_vault.awsbackup_vault.name
    schedule          = "cron(0 5 30 12 ? 2023-2030)" # Monthly on day 30 of December from 2023 to 2030 at 5:00 AM  SGT Every Year
    completion_window = 120
    lifecycle {
      delete_after = 2555
    }
  }
}



resource "aws_backup_selection" "backup_selection" {
  name         = "backup_selection"
  iam_role_arn = aws_iam_role.backup_role.arn
  plan_id      = aws_backup_plan.backup_plan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "awsbackup"
    value = "true"
  }
}
