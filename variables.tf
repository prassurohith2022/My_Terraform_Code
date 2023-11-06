##1. Default Variables:

# 1.1.Tags:

variable "tags" {
  type = map(string)
}


variable "tags-app" {
  type = map(string)
}

variable "tags-db" {
  type = map(string)
}

variable "tags-ep" {
  type = map(string)
}



# 1.2. Variable for default region:

variable "region" {
  type        = string
  description = "region of Aws Account"
}



# 1.3. Variable for Az:

variable "availability_zones" {
  type        = list(string)
  description = "region of Aws Account"

}

##---------------------------------------------------------------------------------------------------------------------------------


## 2. Variables for Access Keys:

# 2.1. Variable for key name of access keys

variable "access_key_names" {
  type        = list(string)
  description = "variable for key_name for ec2"
}


##---------------------------------------------------------------------------------------------------------------------------------
## 3.  Variables for Kms Keys:

# 3.1. variable for kms key name:

variable "kmskey_ebs_name" {
  description = "variable for kmskey_ebs_name"

}

variable "kmskey_s3_name" {
  description = "variable for kmskey_s3_name"

}


##----------------------------------------------------------------------------------------------------------------------------------

## 4. Variables for Iam:

# 4.1. Variable for  s3 iam role policy:

variable "iamrole_policy_s3_access_name" {
  type    = string
  default = "iam role policy for s3 access name"
}


# 4.2. Variable for  lambda execution  role policy:
variable "iamrole_policy_lanbdaexecution_name" {
  default = "iam role policy for lambda execution name"
}


# 4.3. Variable for  ec2 iam role:

variable "iamrole_ec2_name" {
  type    = string
  default = "iam role ec2 name"
}

# 4.4. Variable for  lambda execution iam role:

variable "iamrole_lambdaexecution" {
  type    = string
  default = "iamrole_lambdaexecution"
}

# 4.5. S3 bucket code:

variable "app_code" {
  type    = string
  default = "variable for app_code of s3 bucket policy"
}


#----------------------------------------------------------------------------------------------------------------------------------


# 5. Variables of Vpc:

# 5.1. variables for vpc creation:


variable "vpcname" {
  type        = string
  description = "vpc name to get vpcid"
}
variable "vpccidr" {
  description = "variables for vpccidr"
}


# 5.2. Variables for subnets creation app, db, ep:

variable "subnets_app_names" {

  description = "intranet subnet names"
  default     = []
}

variable "subnets_app_cidrs" {

  description = "intranet subnet cidrs"
  default     = []
}




variable "subnets_db_names" {
  type        = list(string)
  description = "intranet subnet names"
}

variable "subnets_db_cidrs" {
  type        = list(string)
  description = "intranet subnet cidrs"
}

variable "subnets_ep_names" {
  # type        = list(string)
  description = "intranet subnet names"
}

variable "subnets_ep_cidrs" {
  #type        = list(string)
  description = "intranet subnet cidrs"
}





# 5.3. variables of Route Table name app, db, ep:

variable "routetable_app_name" {
  description = "Route Table app name"
}

variable "routetable_db_name" {
  description = "Route Table db name"
}

variable "routetable_ep_name" {
  description = "Route Table ep name"
}




#5.4. Variables for NACL app, db, ep:

variable "nacl_app_name" {
  description = "variables for nacl"
}

variable "nacl_db_name" {
  description = "variables for nacl"
}
variable "nacl_ep_name" {
  description = "variables for nacl"
}

#-------------------------------------------------------------------------------------------------------------------------------------
# 05 Variables for Vpc Ingress: 

variable "tags-ing" {
  type = map(string)
}


#---------------------------------------------------------------------------------------------------------------------------------

# 05. Variables of Vpc-Endpoints:


#1. variables for Endpoints:

variable "security_group_ep_name" {
  type        = string
  description = "SG name for endpoints"
}


variable "endpoints" {
  type        = list(string)
  description = "endpoints creation"
}


variable "endpoint_names" {
  type        = list(string)
  description = "endpoints names"
}


variable "ep_gateway" {
  type        = string
  description = "ep gateway"
}


variable "ep_gateway_name" {
  type        = string
  description = "endpoint gateway name"
}

#-----------------------------------------------------------------------------------------------------------------------------------

/*

## 07 Variables for Nacl Rules App, Db, Ep:

# Variables for Nacl Rules of App:

variable "ingress_rules_rule_number_app" {
  type        = string
  description = "ingress_rules_rule_number_app"
}

variable "ingress_rules_rule_action_app" {
  type        = string
  description = "ingress_rules_rule_action_app"
}

variable "ingress_rules_protocol_app" {
  type        = string
  description = "ingress_rules_protocol_app"
}

variable "ingress_rules_cidr_block_app" {
  type        = string
  description = "ingress_rules_cidr_block_app"
}


variable "ingress_rules_from_port_app" {
  type        = string
  description = "ingress_rules_from_port_app"
}


variable "ingress_rules_to_port_app" {
  type        = string
  description = "ingress_rules_to_port_app"
}


# Variables for Nacl Rules of db:

variable "ingress_rules_rule_number_db" {
  type        = string
  description = "ingress_rules_rule_number_db"
}

variable "ingress_rules_rule_action_db" {
  type        = string
  description = "ingress_rules_rule_action_db"
}

variable "ingress_rules_protocol_db" {
  type        = string
  description = "ingress_rules_protocol_db"
}

variable "ingress_rules_cidr_block_db" {
  type        = string
  description = "ingress_rules_cidr_block_db"
}


variable "ingress_rules_from_port_db" {
  type        = string
  description = "ingress_rules_from_port_db"
}


variable "ingress_rules_to_port_db" {
  type        = string
  description = "ingress_rules_to_port_db"
}

# Variables for Nacl Rules of ep:

variable "ingress_rules_rule_number_ep" {
  type        = string
  description = "ingress_rules_rule_number_ep"
}

variable "ingress_rules_rule_action_ep" {
  type        = string
  description = "ingress_rules_rule_action_ep"
}

variable "ingress_rules_protocol_ep" {
  type        = string
  description = "ingress_rules_protocol_ep"
}

variable "ingress_rules_cidr_block_ep" {
  type        = string
  description = "ingress_rules_cidr_block_ep"
}


variable "ingress_rules_from_port_ep" {
  type        = string
  description = "ingress_rules_from_port_ep"
}


variable "ingress_rules_to_port_ep" {
  type        = string
  description = "ingress_rules_to_port_ep"
}
#-----------------------------------------------------------------------------------------------------------------------------------

*/

#08 Variables for Security Groups:

variable "sg_names" {
  description = "variables for sg_names"
}

#----------------------------------------------------------------------------------------------------------------------------------