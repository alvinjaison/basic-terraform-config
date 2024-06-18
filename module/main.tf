provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "devops" {
  bucket = "${var.project_name}-${var.environment}-tf-bucket"

  tags = {
    Name        = "${var.project_name}-${var.environment}-${var.aws_region}"
    Environment = var.environment
  }
}