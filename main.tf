## 01. Module to create accesskeys:

module "access-keys-01" {
  source           = "./modules/01-access-keys"
  access_key_names = var.access_key_names
  tags             = var.tags
}



#----------------------------------------------------------------------

## 02. Module to create kms-keys:

module "kms-keys-02" {

  source = "./modules/02-kms-keys"

  tags            = var.tags
  kmskey_ebs_name = var.kmskey_ebs_name
  kmskey_s3_name  = var.kmskey_s3_name
}

#------------------------------------------------------------------------

## 03. Module to create Iam roles and profile:

module "iam-03" {
  source                              = "./modules/03-iam"
  tags                                = var.tags
  iamrole_policy_lanbdaexecution_name = var.iamrole_policy_lanbdaexecution_name
  iamrole_ec2_name                    = var.iamrole_ec2_name
  iamrole_lambdaexecution             = var.iamrole_lambdaexecution
  app_code                            = var.app_code
  iamrole_policy_s3_access_name       = var.iamrole_policy_s3_access_name
}

#-----------------------------------------------------------------------------------



## 04. Module to create VPC,Subnets-app-db-ep, RouteTables-app-db-ep, Nacl-app-db-ep:

module "vpc-04" {
  source              = "./modules/04-vpc"
  vpcname             = var.vpcname
  vpccidr             = var.vpccidr
  tags-app            = var.tags-app
  tags-db             = var.tags-db
  tags-ep             = var.tags-ep
  region              = var.region
  availability_zones  = var.availability_zones
  subnets_app_cidrs   = var.subnets_app_cidrs
  subnets_app_names   = var.subnets_app_names
  subnets_db_cidrs    = var.subnets_db_cidrs
  subnets_db_names    = var.subnets_db_names
  subnets_ep_cidrs    = var.subnets_ep_cidrs
  subnets_ep_names    = var.subnets_ep_names
  routetable_app_name = var.routetable_app_name
  routetable_db_name  = var.routetable_db_name
  routetable_ep_name  = var.routetable_ep_name
  nacl_app_name       = var.nacl_app_name
  nacl_db_name        = var.nacl_db_name
  nacl_ep_name        = var.nacl_ep_name
}

#----------------------------------------------------------------------------------------




# 05. Module to create End-Points:

module "vpc-endpoints-05" {
  source                 = "./modules/05-vpc-endpoints"
  vpcname                = var.vpcname
  vpccidr                = var.vpccidr
  subnets_ep             = module.vpc-04.subnets_ep
  security_group_ep_name = var.security_group_ep_name
  endpoints              = var.endpoints
  endpoint_names         = var.endpoint_names
  ep_gateway             = var.ep_gateway
  ep_gateway_name        = var.ep_gateway_name
}

#-----------------------------------------------------------------------------------------

/*

## 06. Module to Create Routes for app, db, ep.

module "vpc-route-rules-06" {
  source               = "./modules/06-vpc-route-rules"
  transit-gateway-name = var.transit-gateway-name
  routtable_app        = module.vpc-04.routtable_app
  routtable_db        = module.vpc-04.routtable_db
  routtable_ep        = module.vpc-04.routtable_ep
  app-routes-cidrs     = var.app-routes-cidrs
  db-routes-cidrs      = var.db-routes-cidrs
  ep-routes-cidrs      = var.ep-routes-cidrs
  routetable_app       = module.vpc.04.routtable_app
  routetable_db        = module.vpc.04.routtable_db
  routetable_ep        = module.vpc.04.routtable_ep
}

#------------------------------------------------------------------------------------------

/*

## 07. Module to Create Nacl Rules for App, Db, Ep:

module "vpc-nacl-rules-07" {
  source                        = "./modules/07-vpc-nacl-rules"
  ingress_rules_rule_number_app = var.ingress_rules_rule_number_app
  ingress_rules_rule_action_app = var.ingress_rules_rule_action_app
  ingress_rules_protocol_app    = var.ingress_rules_protocol_app
  ingress_rules_cidr_block_app  = var.ingress_rules_cidr_block_app
  ingress_rules_from_port_app   = var.ingress_rules_from_port_app
  ingress_rules_to_port_app     = var.ingress_rules_to_port_app
  ingress_rules_rule_number_db  = var.ingress_rules_rule_number_db
  ingress_rules_rule_action_db  = var.ingress_rules_rule_action_db
  ingress_rules_protocol_db     = var.ingress_rules_protocol_db
  ingress_rules_cidr_block_db   = var.ingress_rules_cidr_block_db
  ingress_rules_from_port_db    = var.ingress_rules_from_port_db
  ingress_rules_to_port_db      = var.ingress_rules_to_port_db
  ingress_rules_rule_number_ep  = var.ingress_rules_rule_number_ep
  ingress_rules_rule_action_ep  = var.ingress_rules_rule_action_ep
  ingress_rules_protocol_ep     = var.ingress_rules_protocol_ep
  ingress_rules_cidr_block_ep   = var.ingress_rules_cidr_block_ep
  ingress_rules_from_port_ep    = var.ingress_rules_from_port_ep
  ingress_rules_to_port_ep      = var.ingress_rules_to_port_ep
}

*/
#----------------------------------------------------------------------------------------------------------------------------------



# 08. Module to create Security Groups:

module "security-groups-08" {
  source   = "./modules/08-security-groups"
  sg_names = var.sg_names
}


#---------------------------------------------------------------------------------------------------------------------------------

# 09. Module to Create a Ec2 Servers:


#---------------------------------------------------------------------------------------------------------------------------------

# 10. Module to create Aws Backup Schedule Plan:

module "aws-backup-schedule-10" {
  source = "./modules/10-aws-backup-schedule"
}

#--------------------------------------------------------------------------------------------------------------------------------

