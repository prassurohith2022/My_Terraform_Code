## 06 Vpc-Routes 

# To findout Transit gateway ID:

data "aws_ec2_transit_gateway" "transitgateway" {
  filter {
    name   = "tag:Name"
    values = [var.transit-gateway-name]
  }
}


## 1. Route Table rules for App Subnets:

resource "aws_route" "route_app" {
  count       = length(var.app-routes-cidrs)
  route_table_id            = var.routtable_app
  destination_cidr_block    = var.app-routes-cidrs[count.index]
  transit_gateway_id        = data.aws_ec2_transit_gateway.transitgateway.id
}


## 2. Route Table rules for Db Subnets:

resource "aws_route" "route_db" {
  count       = length(var.db-routes-cidrs)
  route_table_id            = var.routtable_db
  destination_cidr_block    = var.db-routes-cidrs[count.index]
  transit_gateway_id        = data.aws_ec2_transit_gateway.transitgateway.id
}

## 3. Route Table rules for Ep Subnets:

resource "aws_route" "route_ep" {
  count       = length(var.ep-routes-cidrs)
  route_table_id            = var.routtable_ep
  destination_cidr_block    = var.ep-routes-cidrs[count.index]
  transit_gateway_id        = data.aws_ec2_transit_gateway.transitgateway.id
}



