# Define provider
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

#  specifying a backend configuration
terraform {
  backend "s3" {
    bucket = "lili-terraform-state"
    key = "global/s3/terraform.tfstate"
    dynamodb_table = "terraform-state"
    region = "us-east-1"
    encrypt = true
  }
}
