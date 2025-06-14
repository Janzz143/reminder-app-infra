terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Adjust version as needed
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.region  # Correct reference to the 'region' variable in variables.tf
}

