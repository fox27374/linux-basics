terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.LT["region"]
  profile = "nts"
}

# Import public key
resource "aws_key_pair" "dkofler" {
  key_name   = "dkofler-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOHWCgq2DfM8C8eda3oyvwhpD63zUuHRDVeE6R9kDBsh dkofler@CYFQDQYX5V"
}

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

resource "aws_security_group" "linux-training-public" {
  name = "linux-training-public"
  vpc_id =  aws_vpc.linux-training.id

  tags = {
    Name = var.LT["sg_public_name"]
  }
}

resource "aws_security_group_rule" "public-ssh" {
  description       = "Allow SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.linux-training-public.id
}

resource "aws_security_group_rule" "public-web" {
  description       = "Allow port 8080"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.linux-training-public.id
}

resource "aws_security_group_rule" "public-egress" {
  description       = "Allow any"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.linux-training-public.id
}

resource "aws_instance" "bastion" {
  ami           = var.LT["ec2_ami"]
  instance_type = var.LT["ec2_instance_type"]
  subnet_id   = aws_subnet.linux-training-public.id
  security_groups = [ aws_security_group.linux-training-public.id ]
  key_name = "dkofler-key"
  user_data = "${file("user_data.sh")}"
  tags = {
    Name = var.LT["bastion_name"]
  }
}

# Create elastic IP
resource "aws_eip" "linux-training" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = {
    Name = var.LT["vpc_name"]
  }
}
