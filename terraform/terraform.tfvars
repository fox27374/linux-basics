# Linux Training Environment

# General variables
GEN = {
    region = "eu-west-1"
}

# Network variables
NW = {
    vpc_name = "linux-training"
    vpc_cidr = "10.42.22.0/25"
    sn_private_cidr = "10.42.22.0/26"
    sn_private_name = "linux-training-private"
    sn_public_cidr = "10.42.22.64/26"
    sn_public_name = "linux-training-public"
}

# Security variables
SEC = {
    sg_public_name = "linux-training-public"
    sg_private_name = "linux-training-private"
}

# EC2 variables
EC2 = {
    instance_type = "t2.micro"
    ami = "ami-0f98479f8cd5b63f6" # Debian
    public_count = 1
    private_count = 1
    student_name = "student"
    bastion_name = "bastion"
}
