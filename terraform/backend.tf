terraform {
  backend "s3" {
    bucket         = "my-reminder-app-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"  # Still supported, just deprecated notice
    encrypt        = true
  }
}

