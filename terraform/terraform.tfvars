# Linux Training Environment
LT = {
    region = "eu-west-1"
    vpc_cidr = "10.42.22.0/25"
    vpc_name = "linux-training"
    sn_private_cidr = "10.42.22.0/26"
    sn_private_name = "linux-training-private"
    sn_public_cidr = "10.42.22.64/26"
    sn_public_name = "linux-training-public"
    ec2_instance_type = "t2.micro"
    ec2_ami = "ami-0f98479f8cd5b63f6" # Debian
    ec2_count = 1
    bastion_name = "bastion-linux-training"
    sg_public_name = "linux-training-public"
}
