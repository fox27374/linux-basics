# Linux Training Environment

# General variables
GEN = {
    region = "eu-west-1"
}

# Network variables
NW = {
    vpc_name        = "linux-training"
    vpc_cidr        = "10.42.22.0/25"
    sn_private_cidr = "10.42.22.0/26"
    sn_private_name = "private"
    sn_public_cidr  = "10.42.22.64/26"
    sn_public_name  = "public"
}

# Security variables
SEC = {
    sg_public_name  = "public"
    sg_private_name = "private"
}

# EC2 variables
EC2 = {
    instance_type = "t2.micro"
    #ami           = "ami-0f98479f8cd5b63f6" # Debian
    ami           = "ami-096800910c1b781ba" # Ubuntu
    private_count = 2
    student_name  = "tr"
    bastion_name  = "bastion"
}
