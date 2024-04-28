variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0776c814353b4814d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "name_tag" {
  type    = string
  default = "dev"
}

variable "bucket_name" {
  type    = string
  default = "my-bucket-04-28-2024"
}

variable "table_name" {
  type    = string
  default = "my-dynamodb-04-28-2024"
}

variable "lock_id" {
  type    = string
  default = "LockID"
}

variable "tls_description" {
  type    = string
  default = "TLS from VPC"
}

variable "protocol_name" {
  type    = string
  default = "tcp"
}

variable "cidr_address" {
  type    = string
  default = "116.30.20.50/32"
}

variable "common_port" {
  type    = number
  default = 443
}