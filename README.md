# moving-tf-state-file-to-s3-bucket
 #Creating my S3 in Terraform
     resource "aws_s3_bucket" "aliaa-bucket-terraform" {

    bucket = "aliaa-bucket-terraform"
                 }
#Setting up my S3 Backend
    terraform {
  backend "s3" {
    encrypt = true    bucket = "aliaa-bucket-terraform"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}


#Creating DynamoDB Table
  resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
