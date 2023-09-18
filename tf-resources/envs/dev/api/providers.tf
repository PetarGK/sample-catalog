terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.14.0"
    }
  }

  backend "s3" {
    bucket         = "dev-sample-catalog-tf-state"
    key            = "tf-infra/api.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-sample-catalog-tf-locking"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
