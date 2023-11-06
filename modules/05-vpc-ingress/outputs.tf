
#1. output to collect subnet_app ids for later use:

output "subnets_app" {
  description = "subnets_app_ids"
  value = aws_subnet.subnets_app[*].id
}

#2. output to collect subnet_db ids for later use:

output "subnets_db" {
  description = "subnets_db_ids"
  value = aws_subnet.subnets_db[*].id
}


#3. output to collect subnet_ep ids for later use:

output "subnets_ep" {
  description = "subnets_ep_ids"
  value = aws_subnet.subnets_ep[*].id
}


#4. output to collect app routtable  id  for later use:

output "routtable_app" {
  description = "Routtable app id's"
  value = "aws_route_table.route_table_app.id"
}

#5. output to collect db routtable  id  for later use:

output "routtable_db" {
  description = "Routtable db id's"
  value = aws_route_table.route_table_db.id
}

#6. output to collect ep routtable  id  for later use:

output "routtable_ep" {
  description = "Routtable ep id's"
  value = aws_route_table.route_table_ep.id
}

#7. Output to collect Nacl-app id for later use:

output "nacl-app" {
  description = "aws_network_acl.nacl-app.id"
  value = aws_network_acl.nacl-app.id
}

#8. Output to collect Nacl-db id for later use:

output "nacl-db" {
  description = "aws_network_acl.nacl-db.id"
  value = aws_network_acl.nacl-db.id
}



#9. Output to collect Nacl-db id for later use:

output "nacl-ep" {
  description = "aws_network_acl.nacl-ep.id"
  value = aws_network_acl.nacl-ep.id
}
