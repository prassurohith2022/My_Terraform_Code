## 05. creation of Vpc, Subnets, RouteTables & Nacls for Ingress: 

#1. Find the vpc id:

data "aws_vpc" "vpc-id" {
  # Filter the VPC by its name
  filter {
    name   =  "tag:Name"
    values = [var.vpc_ingress_name]                             
  }
}



## 2. Subnets Creation:


#2.1 Subnets creation for Ingress:

resource "aws_subnet" "subnets_ing" {
  count             = length(var.subnets_ing_cidrs)
  cidr_block        = var.subnets_ing_cidrs[count.index]
  vpc_id            = data.aws_vpc.vpc-id.id
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  tags = merge(var.tags-ing, {
  Name = var.subnets_ing_names[count.index]
    
  })
}




#2.2. Subnets Creation for ep-ing:

resource "aws_subnet" "subnets_ep-ing" {
  count             = length(var.subnets_ep-ing_cidrs)
  cidr_block        = var.subnets_ep-ing_cidrs[count.index]
  vpc_id            = data.aws_vpc.vpc-id.id
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  tags = merge(var.tags-ep-ing, {
    Name = var.subnets_ep-ing_names[count.index]
  })
}

## 3. Route Tables Creation :


# 3.1. Routetable for Ingress:

resource "aws_route_table" "route_table_ing" {
  vpc_id = data.aws_vpc.vpc-id.id
  tags = merge(var.tags-ing, {
    Name = var.routetable_ing_name
  })
}


# 3.2. Routetable for ep-ing-ing:

 resource "aws_route_table" "route_table_ep-ing" {
  vpc_id = data.aws_vpc.vpc-id.id
  tags = merge(var.tags-ep-ing, {
    Name = var.routetable_ep-ing_name
  })
}



## 4. RouteTable Associations:

# 4.1. RouteTable Association for Ingress:

resource "aws_route_table_association" "rt_assoc_ing" {
  count			= 2
  route_table_id = aws_route_table.route_table_ing.id
  subnet_id      = aws_subnet.subnets_ing[count.index].id
  }



# 4.2. RouteTable Association for ep-ing-ing:

resource "aws_route_table_association" "rt_assoc_ep-ing" {
  count			= 2
  route_table_id = aws_route_table.route_table_ep-ing.id
  subnet_id      = aws_subnet.subnets_ep-ing[count.index].id
 
  }




## 5. Create NACLS:


# 5.1.Nacl creation for Ingress:

resource "aws_network_acl" "nacl-ing" {
  vpc_id       = data.aws_vpc.vpc-id.id
  subnet_ids      = [ aws_subnet.subnets_ing[0].id, aws_subnet.subnets_ing[1].id ]
  tags = merge(var.tags-ing, {
   Name = var.nacl_ing_name
  })
}


# 5.3.Nacl creation for ep-ing:

resource "aws_network_acl" "nacl-ep-ing" {
  vpc_id       = data.aws_vpc.vpc-id.id
  subnet_ids      = [ aws_subnet.subnets_ep-ing[0].id, aws_subnet.subnets_ep-ing[1].id ]
  tags = merge(var.tags-ep-ing, {
   Name = var.nacl_ep-ing_name
  })
}
