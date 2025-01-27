terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}
provider "aws" {
        region = "us-east-1" 
    #   access_key = "your-access-key"
    #   secret_key = "your-secret-key"
    }