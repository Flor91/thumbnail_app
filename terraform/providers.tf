terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

   backend "s3" {
     bucket = "terraform-remote-state-bucket"
     key    = "thumbnails/terraform.tfstate"
     region = "east-us-1"
 }
}

provider "aws" {
  region = "us-east-1"
}
