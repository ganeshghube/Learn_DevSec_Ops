###  Create VPC with tag name Projectx
resource "aws_vpc" "vpc" {
  enable_dns_support = true
  enable_dns_hostnames = true
  cidr_block = "${var.cidr_block}"

  tags = {
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
  }
}



### Create subnet Public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  count      = length(var.public_cidr)
  cidr_block = element(var.public_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  
    tags = {
    Name   = "${var.project_name}-${element(var.availability_zones, count.index)}-public-subnet"
    Env   =  "${var.project_env}"
  }
}

####Crate Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name  =  "${var.project_name}-public"
    Env   =  "${var.project_env}"
  }
}

# Create Route table public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    }

  tags = {
    Name  =  "${var.project_name}-public"
    Env   =  "${var.project_env}"
  }
}

#Associate Route Table public
resource "aws_route_table_association" "a" {
  count          = length(var.public_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

####################################################################

#### Create subnet Private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc.id
  count      = length(var.private_cidr)
  cidr_block = element(var.private_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
   
    tags = {
    Name   = "${var.project_name}-${element(var.availability_zones, count.index)}-private-subnet"
    Env   =  "${var.project_env}"
  }
}

# Create aws ip
resource "aws_eip" "ip" {
  vpc           = true
  depends_on    = [aws_internet_gateway.gw]
  tags = {
    Name  =  "${var.project_name}-private-ip"
    Env   =  "${var.project_env}"
  }
}


# Create Nat gateway
resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  allocation_id     = aws_eip.ip.id
  subnet_id         = element(aws_subnet.private.*.id, 0)
  depends_on        = [aws_internet_gateway.gw]
    
    tags = {
          Name  =  "${var.project_name}-nat-private"
  }
}


# Create Route table private
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name  =  "${var.project_name}-private"
    Env   =  "${var.project_env}"
  }
}

# #Allocate eip with nat gateway
# resource "aws_eip_association" "example" {
#   allocation_id = aws_eip.ip.id
  
# }

#Associate Route Table private
resource "aws_route_table_association" "b" {
  count          = length(var.private_cidr)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}