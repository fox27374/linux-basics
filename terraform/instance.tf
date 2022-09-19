# Import public key
resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOHWCgq2DfM8C8eda3oyvwhpD63zUuHRDVeE6R9kDBsh dkofler@CYFQDQYX5V"
}

resource "aws_key_pair" "student" {
  key_name   = "student-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHUz0EEreKURiQqFslblHjQ5JTL3Z52v+57HljNO1fD3 dkofler@CYFQDQYX5V"
}

# Create bastion instance
resource "aws_instance" "bastion" {
  ami                    = var.EC2["ami"]
  instance_type          = var.EC2["instance_type"]
  subnet_id              = aws_subnet.public.id
  key_name               = "bastion-key"
  user_data              = "${file("bastion_data.sh")}"
  vpc_security_group_ids = [aws_security_group.public.id]
  tags = {
    Name = var.EC2["bastion_name"]
  }
}

# Create private EC2 instances
resource "aws_instance" "private" {
  count                  = var.EC2["private_count"]
  ami                    = var.EC2["ami"]
  instance_type          = var.EC2["instance_type"]
  subnet_id              = aws_subnet.private.id
  key_name               = "student-key"
  #user_data             = "${file("user_data.sh")}"
  vpc_security_group_ids = [aws_security_group.private.id]
  tags = {
    Name = "${var.EC2["student_name"]}${format("%02d", count.index + 1)}"
  }
}

