
output "bastion-dns-name" {
  value = aws_eip.bastion.public_dns
}

resource "local_file" "ansible_inventory" {
  depends_on = [
    aws_instance.private,
    aws_eip.bastion
  ]
  content = templatefile("${path.module}/templates/inventory.tftpl",
    {
      bastion_instance = aws_instance.bastion
      private_instances = aws_instance.private.*
    }
  )
  filename = "../ansible2/inventory.yml"
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

resource "local_file" "nginx_config" {
  content = templatefile("${path.module}/templates/nginx_config.tftpl",
    {
      private_instances = aws_instance.private.*
    }
  )
  filename = "../ansible2/bastion/files/linux-training.conf"
}
