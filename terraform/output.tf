
output "bastion-dns-name" {
  value = aws_eip.bastion.public_dns
}
output "bastion-public-ip" {
  value = aws_eip.bastion.public_ip
}

output "private-ip-addresses" {
  value = aws_instance.private.*.private_ip
}
