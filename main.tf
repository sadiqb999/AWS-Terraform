resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.free_instance_type

  tags = {
    Name = var.name_tag
  }
}

// s3 bucket for storing the terraform state

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_id


  tags = {
    Name        = "XYZ"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = var.bucket_id
  versioning_configuration {
    status = "Enabled"
  }
}


// KMS key for encryption
resource "aws_kms_key" "a" {
  description             = "KMS key for encrypting terraform state"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "a" {
  name          = "alias/dhaka/banani/${var.region}/key"
  target_key_id = aws_kms_key.a.key_id
}

// dynamodb for locking
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }


  tags = {
    Name        = "dynamodb-table-1"
    Environment = var.env
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
 
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["116.30.20.50/32"]
 
  }

  ingress {
   description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["116.30.20.50/32"]
 }

   ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
   cidr_blocks      = ["116.30.20.50/32"]
  }

  tags = {
    Name = "manual"
  } 
}
