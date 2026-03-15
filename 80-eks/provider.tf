terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.9.0"
    }
  }

  backend "s3" {
    bucket = "latest-84s-remote-state-dev"
    key    = "roboshop-dev-eks"
    region = "<YOUR_AWS_REGION>"
    encrypt        = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "<YOUR_AWS_REGION>"
}