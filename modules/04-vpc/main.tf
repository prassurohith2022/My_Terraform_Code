## 04. creation of Vpc, Subnets, RouteTables & Nacls: 

#1. Find the vpc id:

data "aws_vpc" "vpc-id" {
  # Filter the VPC by its name
  filter {
    name   =  "tag:Name"
    values = [var.vpcname]                             # Replace "YourVPCName" with the actual name of your VPC
  }
}



## 2. Subnets Creation:


#2.1 Subnets creation for App:

resource "aws_subnet" "subnets_app" {
  count             = length(var.subnets_app_cidrs)
  cidr_block        = var.subnets_app_cidrs[count.index]
  vpc_id            = data.aws_vpc.vpc-id.id
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  tags = merge(var.tags-app, {
  Name = var.subnets_app_names[count.index]
    
  })
}



#2.2. Subnets creation for Db:

resource "aws_subnet" "subnets_db" {
  count             = length(var.subnets_db_cidrs)
  cidr_block        = var.subnets_db_cidrs[count.index]
  vpc_id            = data.aws_vpc.vpc-id.id
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  tags = merge(var.tags-db, {
    Name = var.subnets_db_names[count.index]
  })
}



#2.3. Subnets Creation for Ep:

resource "aws_subnet" "subnets_ep" {
  count             = length(var.subnets_ep_cidrs)
  cidr_block        = var.subnets_ep_cidrs[count.index]
  vpc_id            = data.aws_vpc.vpc-id.id
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  tags = merge(var.tags-ep, {
    Name = var.subnets_ep_names[count.index]
  })
}

## 3. Route Tables Creation :


# 3.1. Routetable for App:

resource "aws_route_table" "route_table_app" {
  vpc_id = data.aws_vpc.vpc-id.id
  tags = merge(var.tags-app, {
    Name = var.routetable_app_name
  })
}



# 3.2. Routetable for Db:

 resource "aws_route_table" "route_table_db" {
  vpc_id = data.aws_vpc.vpc-id.id
  tags = merge(var.tags-db, {
    Name = var.routetable_db_name
  })
}


# 3.3. Routetable for ep:

 resource "aws_route_table" "route_table_ep" {
  vpc_id = data.aws_vpc.vpc-id.id
  tags = merge(var.tags-ep, {
    Name = var.routetable_ep_name
  })
}



## 4. RouteTable Associations:

# 4.1. RouteTable Association for App:

resource "aws_route_table_association" "rt_assoc_app" {
  count			= 2
  route_table_id = aws_route_table.route_table_app.id
  subnet_id      = aws_subnet.subnets_app[count.index].id
  }



# 4.2. RouteTable Association for Db:

resource "aws_route_table_association" "rt_assoc_db" {
  count			= 2
  route_table_id = aws_route_table.route_table_db.id
  subnet_id      = aws_subnet.subnets_db[count.index].id
  }


# 4.3. RouteTable Association for Ep:

resource "aws_route_table_association" "rt_assoc_ep" {
  count			= 2
  route_table_id = aws_route_table.route_table_ep.id
  subnet_id      = aws_subnet.subnets_ep[count.index].id
 
  }




## 5. Create NACLS:


# 5.1.Nacl creation for App:

resource "aws_network_acl" "nacl-app" {
  vpc_id       = data.aws_vpc.vpc-id.id
  subnet_ids      = [ aws_subnet.subnets_app[0].id, aws_subnet.subnets_app[1].id ]
  tags = merge(var.tags-app, {
   Name = var.nacl_app_name
  })
}



# 5.2.Nacl creation for Db:

resource "aws_network_acl" "nacl-db" {
  vpc_id       = data.aws_vpc.vpc-id.id
  subnet_ids      = [ aws_subnet.subnets_db[0].id, aws_subnet.subnets_db[1].id ]
  tags = merge(var.tags-db, {
   Name = var.nacl_db_name
  })
}


# 5.3.Nacl creation for Ep:

resource "aws_network_acl" "nacl-ep" {
  vpc_id       = data.aws_vpc.vpc-id.id
  subnet_ids      = [ aws_subnet.subnets_ep[0].id, aws_subnet.subnets_ep[1].id ]
  tags = merge(var.tags-ep, {
   Name = var.nacl_ep_name
  })
}
