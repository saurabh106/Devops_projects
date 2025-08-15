# this name is the refrences name 
resource "aws_s3_bucket" "my-bucket" {
  bucket = "free-devops-bucket"
  tags = {
    name = "free-devops-bucket"
  }
}