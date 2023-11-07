## Variables for Nacls of App, Db, EP:

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