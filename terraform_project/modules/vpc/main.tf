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

# Create subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.cidr_block}"
  
    tags = {
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
  }
}

#Crate Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
  }
}

# #Attach Internet Gateway
# resource "aws_internet_gateway_attachment" "example" {
#   depends_on = [aws_vpc.vpc]
#   internet_gateway_id = aws_internet_gateway.gw.id
#   vpc_id              = aws_vpc.vpc.id
# }

# Create Route table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name  =  "${var.project_name}"
    Env   =  "${var.project_env}"
  }
}


#Associate Route Table 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route.id
}