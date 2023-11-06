# 1. EKS Cluster Deployment with Private Node Group:
======================================================
- In This Module we are going to deploy a EKS-Cluster with Node Group Private.
- Please follow below steps to deploy a cluster:

1. Create a Iam User for Create and Access a Cluster this iam user can have following Custom policy access:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:UpdateAssumeRolePolicy",
                "iam:GetPolicyVersion",
                "iam:List*",
                "aws-marketplace:*",
                "importexport:*",
                "storagegateway:DescribeGatewayInformation",
                "logs:*",
                "iam:RemoveRoleFromInstanceProfile",
                "backup:*",
                "storagegateway:DescribeCachediSCSIVolumes",
                "autoscaling:*",
                "iam:AddRoleToInstanceProfile",
                "secretsmanager:*",
                "events:*",
                "sns:*",
                "cloudformation:*",
                "sts:AssumeRole",
                "cloudwatch:*",
                "ec2:*",
                "eks:*",
                "dynamodb:ListTables",
                "iam:TagRole",
                "cloudtrail:*",
                "iam:DeletePolicy",
                "sqs:*",
                "ds:*",
                "iam:PassRole",
                "storagegateway:ListGateways",
                "ses:*",
                "kms:*",
                "tag:*",
                "elasticfilesystem:*",
                "execute-api:*",
                "iam:GetInstanceProfile",
                "s3:*",
                "mq:*",
                "dynamodb:ListBackups",
                "cloudhsm:*",
                "resource-groups:*",
                "guardduty:*",
                "elasticloadbalancing:*",
                "storagegateway:ListLocalDisks",
                "support:*",
                "storagegateway:DescribeStorediSCSIVolumes",
                "storagegateway:ListVolumes",
                "iam:CreatePolicy",
                "trustedadvisor:*",
                "health:*",
                "backup-storage:*",
                "ssm:*",
                "lambda:*",
                "route53:*",
                "ecr:*",
                "dynamodb:DeleteBackup",
                "elasticache:*",
                "iam:DeletePolicyVersion",
                "acm:*",
                "iam:SetDefaultPolicyVersion",
                "translate:*"
            ],
            "Resource": "*"
        }
    ]
}


2. Create a Iam role for EKS Cluster Creation.
3. Create a Iam role for Eks Private Node Group creation.
4. create a security group for ekscluster for both master & worker.
5. create a access key pair for private node group access.

# 2. Connect your Eks Cluster:
================================
1. Install Kubectl:
-------------------
- curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.6/2023-10-17/bin/linux/amd64/kubectl
- sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
- chmod +x kubectl
- mkdir -p ~/.local/bin
- mv ./kubectl ~/.local/bin/
- echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
- verify :  "kubectl version --client"

2. Install Aws Cli:
---------------------
- curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
- unzip awscliv2.zip
- sudo ./aws/install
- Verify with  # aws --version

3. Download EKS Cluster KubeConfig to access the cluster:
------------------------------------------------------------
 - aws eks update-kubeconfig --region region-code --name my-cluster

4. Verify Eks Cluster:
---------------------------
- aws eks describe-cluster --name your-cluster-name --region your-region
- aws eks list-nodegroups --cluster-name your-cluster-name --region your-region
- aws eks describe-nodegroup --cluster-name your-cluster-name --nodegroup-name your-nodegroup-name --region your-region
- kubectl get pods --all-namespaces
