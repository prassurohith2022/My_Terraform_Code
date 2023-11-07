## 05.Vpc Endpoint Creation

#1. Find the vpc id:

data "aws_vpc" "vpc-id" {
  # Filter the VPC by its name
  filter {
    name   =  "tag:Name"
    values = [var.vpcname]                             # Replace "YourVPCName" with the actual name of your VPC
  }
}


data "aws_route_tables" "all_route_tables" {
  vpc_id = data.aws_vpc.vpc-id.id
}


#2. Security group for Endpoint:

resource "aws_security_group" "sg-endpoint" {
  name        =  var.security_group_ep_name
  description =  var.security_group_ep_name
  vpc_id      =  data.aws_vpc.vpc-id.id
  tags = merge(var.tags-ep, {
   Name = var.security_group_ep_name
  })
  }

resource "aws_security_group_rule" "sg-endpoint_rule01" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${var.vpccidr}"]
  security_group_id = aws_security_group.sg-endpoint.id
  description       = "Incoming traffic from 443"
}
resource "aws_security_group_rule" "sg-endpoint_rule02" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-endpoint.id
  description       = "outgoing traffic"
}


##3. VPC Endpoint creation Interface for Intranet

resource "aws_vpc_endpoint" "ep1" {
  count = length(var.endpoints)
  subnet_ids = var.subnets_ep 
  security_group_ids = [aws_security_group.sg-endpoint.id]
  service_name        = var.endpoints[count.index]
  vpc_id              = data.aws_vpc.vpc-id.id
  private_dns_enabled = true
  vpc_endpoint_type = "Interface"
  tags = merge(var.tags-ep, {
   Name = var.endpoint_names[count.index]
  })
}


##4. VPC Endpoint creation Gateway

resource "aws_vpc_endpoint" "ep2" {
  route_table_ids = data.aws_route_tables.all_route_tables.ids 
  service_name = var.ep_gateway
  vpc_endpoint_type = "Gateway"
  vpc_id       = data.aws_vpc.vpc-id.id
   tags = merge(var.tags-ep, {
   Name = var.ep_gateway_name
  })
}

