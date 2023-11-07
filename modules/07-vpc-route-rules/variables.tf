# Variables for routetable rules:

variable "transit-gateway-name" {
  description = "To get transitgatewayid"
}

variable "app-routes-cidrs" {
  description = "variables for app-route-cidrs"
}

variable "db-routes-cidrs" {
  description = "variables for app-route-cidrs"
}
variable "ep-routes-cidrs" {
  description = "variables for ep-route-cidrs"
}


variable "routetable_app" {
 
  description = "Route Table app rules"
}

variable "routetable_db" {

  description = "Route Table db rules"
}

variable "routetable_ep" {

  description = "Route Table ep rules"
}
