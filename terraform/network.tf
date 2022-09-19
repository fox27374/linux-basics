# Create VPC
resource "aws_vpc" "linux-training" {
  cidr_block           = var.NW["vpc_cidr"]
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.NW["vpc_name"]
  }
}

# Create Subnets
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.linux-training.id
  cidr_block = var.NW["sn_private_cidr"]
  tags = {
    Name = var.NW["sn_private_name"]
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.linux-training.id
  cidr_block = var.NW["sn_public_cidr"]
  tags = {
    Name = var.NW["sn_public_name"]
  }
}

# Create internet gateway
resource "aws_internet_gateway" "linux-training" {
  vpc_id =  aws_vpc.linux-training.id
  tags = {
    Name = var.NW["vpc_name"]
  }
}

# Create NAT gateway
resource "aws_nat_gateway" "linux-training" {
  allocation_id = aws_eip.nat-gateway.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.linux-training]
  tags = {
    Name = var.NW["vpc_name"]
  }
}

# Routing table for public subnet
resource "aws_route_table" "linux-training-public" {
  vpc_id =  aws_vpc.linux-training.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.linux-training.id
    }
    tags = {
    Name = var.NW["sn_public_name"]
  }
}

# Routing table for private subnet
resource "aws_route_table" "private" {
   vpc_id =  aws_vpc.linux-training.id
    route {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.linux-training.id
      #gateway_id = aws_internet_gateway.linux-training.id
   }
   tags = {
    Name = var.NW["sn_private_name"]
  }
 }

# Associate routing tables with subnets
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.linux-training-public.id
}

# Create elastic IPs
resource "aws_eip" "nat-gateway" {
  vpc        = true
  depends_on = [aws_internet_gateway.linux-training]
  tags = {
    Name = var.NW["vpc_name"]
  }
}

resource "aws_eip" "bastion" {
  vpc        = true
  depends_on = [aws_instance.bastion]
  instance   = aws_instance.bastion.id
  tags = {
    Name = var.NW["vpc_name"]
  }
}

