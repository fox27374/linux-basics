# Import public key
resource "aws_key_pair" "dkofler" {
  key_name   = "dkofler-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOHWCgq2DfM8C8eda3oyvwhpD63zUuHRDVeE6R9kDBsh dkofler@CYFQDQYX5V"
}

resource "aws_key_pair" "student" {
  key_name   = "student-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOHWCgq2DfM8C8eda3oyvwhpD63zUuHRDVeE6R9kDBsh dkofler@CYFQDQYX5V"
}

# Create public EC2 instances
resource "aws_instance" "bastion" {
  #count = var.EC2["ec2_public_count"]
  ami           = var.EC2["ami"]
  instance_type = var.EC2["instance_type"]
  subnet_id   = aws_subnet.linux-training-public.id
  key_name = "dkofler-key"
  user_data = "${file("user_data.sh")}"
  tags = {
    Name = var.EC2["bastion_name"]
  }
}

# Create private EC2 instances
resource "aws_instance" "private" {
  count = var.EC2["private_count"]
  ami           = var.EC2["ami"]
  instance_type = var.EC2["instance_type"]
  subnet_id   = aws_subnet.linux-training-private.id
  key_name = "student-key"
  #user_data = "${file("user_data.sh")}"
  tags = {
    Name = "${var.EC2["student_name"]}${format("%02d", count.index + 1)}"
  }
}

# Attach SG to instance
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.linux-training-public.id
  network_interface_id = aws_instance.bastion.primary_network_interface_id
}
