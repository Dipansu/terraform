resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-test-mybucketnew-10010012213"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}