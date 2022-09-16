terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

# Linux Training Environment
variable "LT" {
  type    = map  
}

provider "aws" {
  region  = var.LT["region"]
  profile = "nts"
}
