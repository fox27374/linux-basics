# Import public key
resource "aws_key_pair" "dkofler" {
  key_name   = "dkofler-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOHWCgq2DfM8C8eda3oyvwhpD63zUuHRDVeE6R9kDBsh dkofler@CYFQDQYX5V"
}

# Create multiple EC2 instances
resource "aws_instance" "bastion" {
  #count = var.LT["ec2_count"]
  ami           = var.LT["ec2_ami"]
  instance_type = var.LT["ec2_instance_type"]
  subnet_id   = aws_subnet.linux-training-public.id
  key_name = "dkofler-key"
  user_data = "${file("user_data.sh")}"
  tags = {
    Name = var.LT["bastion_name"]
  }
}

# Attach SG to instance
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.linux-training-public.id
  network_interface_id = aws_instance.bastion.primary_network_interface_id
}

# Create elastic IP
resource "aws_eip" "linux-training" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = {
    Name = var.LT["vpc_name"]
  }
}