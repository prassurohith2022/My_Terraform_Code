# Create ingress rules
resource "aws_network_acl_rule" "ingress-db" {
  count            = length(var.ingress_rules)
  network_acl_id   = aws_network_acl.nacl.id
  rule_number      = var.ingress_rules_rule_number_db[count.index]
  rule_action      = var.ingress_rules_rule_action_db[count.index]
  protocol         = var.ingress_rules_protocol_db[count.index]
  cidr_block       = var.ingress_rules_cidr_block_db[count.index]
  from_port        = var.ingress_rules_from_port_db[count.index]
  to_port          = var.ingress_rules_to_port_db[count.index]
  egress           = false
}

# Create egress rules
resource "aws_network_acl_rule" "egress-db" {
  count            = length(var.ingress_rules)
  network_acl_id   = aws_network_acl.nacl.id
  rule_number      = var.egress_rules_rule_number_db[count.index]
  rule_action      = var.egress_rules_rule_action_db[count.index]
  protocol         = var.egress_rules_protocol_db[count.index]
  cidr_block       = var.egress_rules_cidr_block_db[count.index]
  from_port        = var.egress_rules_from_port_db[count.index]
  to_port          = var.egress_rules_to_port_db[count.index]
  egress           = true
}
