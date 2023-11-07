# 4. Variables of Vpc:

#1. Tags for Vpc:

variable "tags-app" {
  type = map(string)
}

variable "tags-db" {
  type = map(string)
}

variable "tags-ep" {
  type = map(string)
}


#2. Variable for default region:

variable "region" {
  type        = string
  description = "region of Aws Account"
}



#3. Variable for Az:

variable "availability_zones" {
  type        = list(string)
  description = "region of Aws Account"

}


#4. variables for vpc creation:


variable "vpcname" {
  type        = string
  description = "vpc name to get vpcid"
}
variable "vpccidr" {
  description = "variables for vpccidr"
}


#5 Variables for subnets creation app, db, ep:

variable "subnets_app_names" {
  
  description = "intranet subnet names"
  default = []
}

variable "subnets_app_cidrs" {
  description = "intranet subnet cidrs"
  default = []
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




#6 variables of Route Table name app, db, ep:

variable "routetable_app_name" {
 
  description = "Route Table app name"
}

variable "routetable_db_name" {

  description = "Route Table db name"
}

variable "routetable_ep_name" {

  description = "Route Table ep name"
}




#7 Variables for NACL app, db, ep:

variable "nacl_app_name" {
  description = "variables for nacl"
}

variable "nacl_db_name" {
  description = "variables for nacl"
}
variable "nacl_ep_name" {
  description = "variables for nacl"
}



