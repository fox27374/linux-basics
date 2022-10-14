resource "aws_security_group" "public" {
  name        = "Allow from public"
  description = "Allow from public"
  vpc_id      = aws_vpc.linux-training.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Custom HTTP"
    from_port        = 8004
    to_port          = 8062
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow from public"
  }
}

resource "aws_security_group" "private" {
  name        = "Allow from Bastion"
  description = "Allow from Bastion"
  vpc_id      = aws_vpc.linux-training.id

  ingress {
    description      = "SSH from Bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.public.id]
  }

  ingress {
    description      = "HTTP from Bastion"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.public.id]
  }

  ingress {
    description      = "ICMP from private"
    from_port        = 8
    to_port          = 0
    protocol         = "icmp"
    security_groups  = [aws_security_group.pprivate.id]
  }

  ingress {
    description      = "SQL from private"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.pprivate.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow from Bastion"
  }
}
