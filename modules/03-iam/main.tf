## 03-Create Iam roles:

#1. Filter policys  for ec2 instance profile:

data "aws_iam_policy" "AmazonEC2RoleforSSM" {
  name = "AmazonEC2RoleforSSM"
}

data "aws_iam_policy" "CloudWatchAgentAdminPolicy" {
  name = "CloudWatchAgentAdminPolicy"
}

data "aws_iam_policy" "CloudWatchAgentServerPolicy" {
  name = "CloudWatchAgentServerPolicy"
}

data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  name = "AmazonSSMManagedInstanceCore"
}

#2. To get Current Account ID:

data "aws_caller_identity" "current" {}




#3. create policy for IAM ROLE S3 Bucket:

resource "aws_iam_policy" "iampolicy_s3access" {
    name = var.iamrole_policy_s3_access_name
    description = "s3 access policy"


    policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "s3:*",
              ],
              "Resource": [
                  "arn:aws:s3:::sst-s3-${var.app_code}-*/",
                  "arn:aws:s3:::sst-s3-${var.app_code}-*/*"
              ]
          },
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": [
                  "kms:Decrypt",
                  "kms:Encrypt",
                  "kms:DescribeKey",
                  "kms:ReEncrypt*",
                  "kms:GenerateDataKey*"
              ],
              "Resource": "arn:aws:kms:ap-southeast-1:${data.aws_caller_identity.current.account_id}:*"
          }
      ]
    })
}


#4. Created Policy for IAM Role Lambda


resource "aws_iam_policy" "iampolicy_lambdaexecution" {
    name = var.iamrole_policy_lanbdaexecution_name
    description = "lambda execution policy"


    policy = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "ec2:CreateNetworkInterface",
                    "ec2:DeleteNetworkInterface",
                    "ec2:DescribeNetworkInterfaces",
                    "logs:*"
                ],
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": [
                    "secretsmanager:*"
                ],
                "Resource": [
                    "arn:aws:secretsmanager:*",
                ]
            },
        ]
    })
}



#5. Create an iam role for ec2 instance:



resource "aws_iam_role" "iamrole_ec2" {
    name = var.iamrole_ec2_name
    path = "/"

    assume_role_policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    })
    tags = merge(var.tags, {
   Name = var.iamrole_ec2_name
  })
}


#6. Attached IAM Role and the new created Policy

locals {
  policy_attachments = {
    "ec2_role_ssm" = data.aws_iam_policy.AmazonEC2RoleforSSM.arn,
    "cloudwatch_agent_admin" = data.aws_iam_policy.CloudWatchAgentAdminPolicy.arn,
    "cloudwatch_agent_server" = data.aws_iam_policy.CloudWatchAgentServerPolicy.arn,
    "ssm_managed_instance_core" = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn,
    "s3_access" = aws_iam_policy.iampolicy_s3access.arn
  }
}

resource "aws_iam_role_policy_attachment" "attachment_ec2role" {
  for_each = local.policy_attachments
  role       = aws_iam_role.iamrole_ec2.name
  policy_arn = each.value

}




#7. Create iam instance profile  for an Ec2 instance:


resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = var.iamrole_ec2_name
  role = aws_iam_role.iamrole_ec2.name
   tags = merge(var.tags, {
   Name = var.iamrole_ec2_name
  })
}




#8. create assume role lambda

resource "aws_iam_role" "iamrole_lambdaexecution" {
    name = var.iamrole_lambdaexecution
    path = "/"

    assume_role_policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    })
    tags = merge(var.tags, {
   Name = var.iamrole_ec2_name
  })

}


# Attached IAM Role and the new created Policy
resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.iamrole_lambdaexecution.name
  policy_arn = aws_iam_policy.iampolicy_lambdaexecution.arn
}

