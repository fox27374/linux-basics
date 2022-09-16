# Create VPC
resource "aws_vpc" "linux-training" {
  cidr_block       = var.LT["vpc_cidr"]
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = var.LT["vpc_name"]
  }
}

# Create Subnets
resource "aws_subnet" "linux-training-private" {
  vpc_id     = aws_vpc.linux-training.id
  cidr_block = var.LT["sn_private_cidr"]
  tags = {
    Name = var.LT["sn_private_name"]
  }
}
resource "aws_subnet" "linux-training-public" {
  vpc_id     = aws_vpc.linux-training.id
  cidr_block = var.LT["sn_public_cidr"]
  tags = {
    Name = var.LT["sn_public_name"]
  }
}

# Create internet gateway
resource "aws_internet_gateway" "linux-training" {
  vpc_id =  aws_vpc.linux-training.id
  tags = {
    Name = var.LT["vpc_name"]
  }
}

# Create NAT gateway
#resource "aws_nat_gateway" "linux-training" {
#  allocation_id = aws_eip.linux-training.id
#  subnet_id = aws_subnet.linux-training-public.id
#  tags = {
#    Name = var.LT["vpc_name"]
#  }
#}

# Routing table for public subnet
resource "aws_route_table" "linux-training-public" {
  vpc_id =  aws_vpc.linux-training.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.linux-training.id
    }
    tags = {
    Name = var.LT["sn_public_name"]
  }
}

# Routing table for private subnet
resource "aws_route_table" "linux-training-private" {
   vpc_id =  aws_vpc.linux-training.id
    route {
      cidr_block = "0.0.0.0/0"
      #nat_gateway_id = aws_nat_gateway.linux-training.id
      gateway_id = aws_internet_gateway.linux-training.id
   }
   tags = {
    Name = var.LT["sn_private_name"]
  }
 }

# Associate routing tables with subnets
resource "aws_route_table_association" "linux-training-private" {
  subnet_id      = aws_subnet.linux-training-private.id
  route_table_id = aws_route_table.linux-training-private.id
}

resource "aws_route_table_association" "linux-training-public" {
  subnet_id      = aws_subnet.linux-training-public.id
  route_table_id = aws_route_table.linux-training-public.id
}