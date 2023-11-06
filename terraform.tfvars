tags = {
  Agency-Code  = "test1"
  Environment  = "uat"
  Project-Code = "test1"
}

tags-app = {
  Agency-Code  = "test1"
  Environment  = "Production"
  Project-Code = "MyProject"
  Tier         = "app"
}

tags-db = {
  Agency-Code  = "test1"
  Environment  = "Production"
  Project-Code = "MyProject"
  Tier         = "db"
}

tags-ep = {
  Agency-Code  = "test1"
  Environment  = "Production"
  Project-Code = "MyProject"
  Tier         = "ep"
}


# 1. variables for Access keys :

access_key_names = ["key-test1-uatez", "key-test1-uatiz"]

#---------------------------------------------------------------------------------------------------------------------------------

# 2. Variables for kms keys:
kmskey_ebs_name = "key-test1-uat-ec2-ebs"
kmskey_s3_name  = "key-test1-uat-ec2-s3"


#----------------------------------------------------------------------------------------------------------------------------------

# 3. Variables for Iam Role & Policys:

iamrole_policy_lanbdaexecution_name = "iampolicy-test1-uatezapp-lambdaexecution"
iamrole_ec2_name                    = "iamrole-test1-uatezapp-ec2"
iamrole_lambdaexecution             = "iamrole-test1-uatezapp-lambdaexecution"
app_code                            = "test1"
iamrole_policy_s3_access_name       = "iampolicy-test1-uatezapp-s3"

#----------------------------------------------------------------------------------------------------------------------------------

# 4. Variables for vpc:

vpcname             = "my-vpc"
vpccidr             = "10.219.26.128/25"
region              = "ap-southeast-1"
availability_zones  = ["ap-southeast-1a", "ap-southeast-1b"]
subnets_app_cidrs   = ["10.219.26.128/27", "10.219.26.160/27"]
subnets_app_names   = ["sub-a-test1-uatez-app01", "sub-b-test1-uatez-app01"]
subnets_db_cidrs    = ["10.219.26.192/28", "10.219.26.208/28"]
subnets_db_names    = ["sub-a-test1-uatez-db01", "sub-b-test1-uatez-db01"]
subnets_ep_cidrs    = ["10.219.26.224/28", "10.219.26.240/28"]
subnets_ep_names    = ["sub-a-test1-uatez-ep01", "sub-b-test1-uatez-ep02"]
routetable_app_name = "rt-test1-uatez-app"
routetable_db_name  = "rt-test1-uatez-db"
routetable_ep_name  = "rt-test1-uatez-ep"
nacl_app_name       = "nacl-test1-uatez-app"
nacl_db_name        = "nacl-test1-uatez-db"
nacl_ep_name        = "nacl-test1-uatez-ep"
#---------------------------------------------------------------------------------------------------------------------------------

# 5. Variables for vpc Endpoints:

security_group_ep_name = "sgrp-test1-uatez-ep"
endpoints              = ["com.amazonaws.ap-southeast-1.monitoring", "com.amazonaws.ap-southeast-1.ec2", "com.amazonaws.ap-southeast-1.ec2messages", "com.amazonaws.ap-southeast-1.logs", "com.amazonaws.ap-southeast-1.ssm", "com.amazonaws.ap-southeast-1.ssmmessages", "com.amazonaws.ap-southeast-1.kms", "com.amazonaws.ap-southeast-1.s3", "com.amazonaws.ap-southeast-1.elasticloadbalancing", "com.amazonaws.ap-southeast-1.sts", "com.amazonaws.ap-southeast-1.ecr.api", "com.amazonaws.ap-southeast-1.execute-api", "com.amazonaws.ap-southeast-1.ecr.dkr", "com.amazonaws.ap-southeast-1.elasticfilesystem", "com.amazonaws.ap-southeast-1.eks"]
endpoint_names         = ["com.amazonaws.ap-southeast-1.monitoring", "com.amazonaws.ap-southeast-1.ec2", "com.amazonaws.ap-southeast-1.ec2messages", "com.amazonaws.ap-southeast-1.logs", "com.amazonaws.ap-southeast-1.ssm", "com.amazonaws.ap-southeast-1.ssmmessages", "com.amazonaws.ap-southeast-1.kms", "com.amazonaws.ap-southeast-1.s3", "com.amazonaws.ap-southeast-1.elasticloadbalancing", "com.amazonaws.ap-southeast-1.sts", "com.amazonaws.ap-southeast-1.ecr.api", "com.amazonaws.ap-southeast-1.execute-api", "com.amazonaws.ap-southeast-1.ecr.dkr", "com.amazonaws.ap-southeast-1.elasticfilesystem", "com.amazonaws.ap-southeast-1.eks"]
ep_gateway             = "com.amazonaws.ap-southeast-1.s3"
ep_gateway_name        = "vpce-test1-uatezapp-s3"

#---------------------------------------------------------------------------------------------------------------------------------------
# 6. Variables for Route Rules:


#-------------------------------------------------------------------------------------------------------------------------------------
# 7. Variables for NACL Rules:



#------------------------------------------------------------------------------------------------------------------------------------------------
# 8. Variables for Security Groups:

sg_names = ["test1", "test2"]



#-------------------------------------------------------------------------------------------------------------------------------------
# 09. variables for Ec2 Servers:



#--------------------------------------------------------------------------------------------------------------------------------------
# 10. Variables for Aws-Backup-Schedule:

#-------------------------------------------------------------------------------------------------------------------------------------
