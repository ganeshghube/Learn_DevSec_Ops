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
  cidr_block = "${var.public_cidr}"
  
    tags = {
    Name  =  "${var.project_name}-public-subnet"
    Env   =  "${var.project_env}"
  }
}

#### Create subnet Private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.private_cidr}"
  
    tags = {
    Name  =  "${var.project_name}-private-subnet"
    Env   =  "${var.project_env}"
  }
}

# Create aws ip
resource "aws_eip" "ip" {
  vpc      = true
}

# Create Nat gateway
resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  allocation_id     = aws_eip.ip.id
  subnet_id         = aws_subnet.private.id
      tags = {
    Name  =  "${var.project_name}-eip"
  }
  depends_on  = [aws_eip.ip]
}


####Crate Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
  }
}

# Create Route table public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "${var.public_cidr}"
    gateway_id = aws_internet_gateway.gw.id
    
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
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
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
  }
}

#Associate Route Table public
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

#Associate Route Table private
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}