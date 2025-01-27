terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2"
    }
    aws = {
        region = "us-east-1" 
    #   access_key = "your-access-key"
    #   secret_key = "your-secret-key"
    }
  }
}
