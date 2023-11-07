# 05. Variables of Vpc-Endpoints:

#  Tags for Vpc-End Points:

variable "tags-ep" {
  type = map(string)
  default = {
    Agency-Code      = "sla"
    Environment      = "Production"
    Project-Code     = "MyProject"
    Tier             = "ep"
  }
}


#1. variables for Vpcname:

variable "vpcname" {
  type        = string
  description = "vpc name to get vpcid"
}

variable "subnets_ep" {
  type        = list(string)
  description = "subnets_ep"
}


#2. variables for Endpoints:

variable "security_group_ep_name" {
  type        = string
  description = "SG name for endpoints"
}


variable "vpccidr" {
  type        = string
  description = "vpccidr"
}


variable "endpoints" {
  type  = list(string)
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



