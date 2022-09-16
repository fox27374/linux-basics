terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

# Generalvariables
variable "GEN" {
  type    = map  
}

# Network variables
variable "NW" {
  type    = map  
}

# Security variables
variable "SEC" {
  type    = map  
}

# EC2 variables
variable "EC2" {
  type    = map  
}

provider "aws" {
  region  = var.GEN["region"]
  profile = "nts"
}
