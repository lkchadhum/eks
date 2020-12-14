
###### vpc #######

resource "aws_vpc" "eks_setup" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.vpc_tags
}
#######  Subnets ######

resource "aws_subnet" "subnet-1" {
  cidr_block        = var.subnet_1_cidr
  vpc_id            = aws_vpc.eks_setup.id
  availability_zone = var.az1
  tags              = var.subnet_tags
}

resource "aws_subnet" "subnet-2" {
  cidr_block        = var.subnet_2_cidr
  vpc_id            = aws_vpc.eks_setup.id
  availability_zone = var.az2
  tags              = var.subnet_tags
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block        = var.private_subnet_1_cidr
  vpc_id            = aws_vpc.eks_setup.id
  availability_zone = var.az1
  tags              = var.subnet_tags
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block        = var.private_subnet_2_cidr
  vpc_id            = aws_vpc.eks_setup.id
  availability_zone = var.az2
  tags              = var.subnet_tags
}


########### Route-Table ########
resource "aws_route_table" "public-route-table" {
  vpc_id    = aws_vpc.eks_setup.id
  tags      =  var.tags

}

resource "aws_route_table" "private-route-table" {
  vpc_id   = aws_vpc.eks_setup.id
  tags     = var.tags
}

######### Subnet association to RT #########

resource "aws_route_table_association" "subnet-1-association" {
  route_table_id  = aws_route_table.public-route-table.id
  subnet_id       = aws_subnet.subnet-1.id
}

resource "aws_route_table_association" "subnet-2-association" {
  route_table_id  = aws_route_table.public-route-table.id
  subnet_id       = aws_subnet.subnet-2.id
}

resource "aws_route_table_association" "private-subnet-1-association" {
  route_table_id  = aws_route_table.private-route-table.id
  subnet_id       = aws_subnet.private-subnet-1.id
}

resource "aws_route_table_association" "private-subnet-2-association" {
  route_table_id  = aws_route_table.private-route-table.id
  subnet_id       = aws_subnet.private-subnet-2.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks_setup.id
  tags   = var.tags
}

resource "aws_route" "public-internet-gw-route" {
  route_table_id          = aws_route_table.public-route-table.id
  gateway_id              = aws_internet_gateway.igw.id
  destination_cidr_block  = "0.0.0.0/0"
}



