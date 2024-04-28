terraform {
  backend "s3" {
    bucket         = "this-a-simple-bucket-04-28-2024"
    key            = "dhaka/banani/default.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "secret-dynamodb-dhaka"
  }
}