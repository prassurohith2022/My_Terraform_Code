# 4. Variables of Vpc:

#1. Tags for Vpc:

variable "tags-ing" {
  type = map(string)
}

variable "tags-ep-ing" {
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


variable "vpc_ingress_name" {
  type        = string
  description = "vpc name to get vpcid"
}
variable "vpccidr_ing" {
  description = "variables for vpccidr"
}


#5 Variables for subnets creation ing,  ep-ing-ing:

variable "subnets_ing_names" {
  
  description = "intranet subnet names"
  default = []
}

variable "subnets_ing_cidrs" {
  description = "intranet subnet cidrs"
  default = []
}


variable "subnets_ep-ing_names" {
  # type        = list(string)
  description = "intranet subnet names"
}

variable "subnets_ep-ing_cidrs" {
  #type        = list(string)
  description = "intranet subnet cidrs"
}




#6 variables of Route Table name ing, db, ep-ing:

variable "routetable_ing_name" {
 
  description = "Route Table ing name"
}


variable "routetable_ep-ing_name" {

  description = "Route Table ep-ing name"
}




#7 Variables for NACL ing, db, ep-ing:

variable "nacl_ing_name" {
  description = "variables for nacl"
}

variable "nacl_ep-ing_name" {
  description = "variables for nacl"
}



 