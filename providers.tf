terraform {
  required_providers {
    aws = {
      version = "~> 5.92"
      source  = "hashicorp/aws"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
   region = var.region
}

