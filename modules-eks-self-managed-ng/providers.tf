terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAV2IJIA32MR62HMMS"
  secret_key = "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"

}
