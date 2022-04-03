terraform {
  backend "s3" {
    encrypt = true
    bucket = "aliaa-bucket-terraform"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}
