terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  description = "AWS region for the provider."
  type        = string
  default     = "us-east-1"
}

variable "origin_domain_name" {
  description = "Origin domain name to serve content from."
  type        = string
}

provider "aws" {
  region = var.region
}

module "cloudfront" {
  source = "../.."

  comment            = "example distribution"
  origin_domain_name = var.origin_domain_name

  tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

output "distribution_domain_name" {
  value = module.cloudfront.domain_name
}
