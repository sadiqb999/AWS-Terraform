terraform {
  backend "s3" {
    bucket         = "my-bucket-04-28-2024"
    key            = "dhaka/banani/default.tfstate"
    encrypt        = true
    region         = "eu-west-1"
    dynamodb_table = "my-dynamodb-04-28-2024"
  }
}