resource "aws_security_group" "linux-training-public" {
  name = "linux-training-public"
  vpc_id =  aws_vpc.linux-training.id

  tags = {
    Name = var.SEC["sg_public_name"]
  }
}

resource "aws_security_group" "linux-training-private" {
  name = "linux-training-private"
  vpc_id =  aws_vpc.linux-training.id

  tags = {
    Name = var.SEC["sg_private_name"]
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

resource "aws_security_group_rule" "private-ssh" {
  description       = "Allow SSH from bastion host"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.linux-training-private.id
}