# this name is the refrences name 
resource "aws_s3_bucket" "my-bucket" {
  bucket = "${var.my-env}-free-devops-bucket"
  tags = {
    name = "${var.my-env}-free-devops-bucket"
    environment = var.my-env
  }
}