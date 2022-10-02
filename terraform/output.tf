
output "bastion-dns-name" {
  value = aws_eip.bastion.public_dns
}
output "bastion-public-ip" {
  value = aws_eip.bastion.public_ip
}

output "private-ip-addresses" {
  value = aws_instance.private.*.private_ip
}

resource "local_file" "ansible_inventory" {
  depends_on = [
    aws_instance.private
  ]
  content = templatefile("${path.module}/templates/inventory.tftpl",
    {
      bastion_instance = aws_instance.bastion
      private_instances = aws_instance.private.*
    }
  )
  filename = "output/inventory.yaml"
}

resource "local_file" "ssh_config" {
  content = templatefile("${path.module}/templates/ssh_config.tftpl",
    {
      bastion_instance = aws_instance.bastion
      private_instances = aws_instance.private.*
    }
  )
  filename = "output/ssh_config"
}