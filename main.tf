# Create EC2 instance
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.name_tag
  }
}

# Create S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = var.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

// KMS key for encryption
resource "aws_kms_key" "a" {
  description             = "KMS key for encrypting"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "a" {
  name          = "alias/europe/${var.region}/key"
  target_key_id = aws_kms_key.a.key_id
}

// dynamodb for locking
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.lock_id

  attribute {
    name = var.lock_id
    type = "S"
  }


  tags = {
    Name        = "dynamodb-table-ireland-1"
    Environment = "Dev"
  }
}

# Create Security Group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = var.tls_description
    from_port   = var.common_port
    to_port     = var.common_port
    protocol    = var.protocol_name
    cidr_blocks = [var.cidr_address]

  }

  ingress {
    description = var.tls_description
    from_port   = 80
    to_port     = 80
    protocol    = var.protocol_name
    cidr_blocks = [var.cidr_address]
  }

  ingress {
    description = var.tls_description
    from_port   = var.common_port
    to_port     = var.common_port
    protocol    = var.protocol_name
    cidr_blocks = [var.cidr_address]
  }

  tags = {
    Name = "manual"
  }
}

