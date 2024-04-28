variable "region" {
  description = "region where deploymeny will occur"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "This is the Amazon Machine Image ID"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "free_instance_type" {
  description = "Free tier eligible"
  type        = string
  default     = "t2.micro"
}

variable "name_tag" {
  type    = string
  default = "dev"
}

variable "bucket_id" {
  description = "S3 bucket for storing Terraform state"
  type        = string
  default     = "this-a-simple-bucket-04-28-2024"
}

variable "table_name" {
  description = "name for the dynamodb table"
  type        = string
  default     = "secret-dynamodb-dhaka"
}

variable "env" {
  type    = string
  default = "Atmosphere"
}
