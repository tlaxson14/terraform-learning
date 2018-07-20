#Create S3 Bucket
resource "aws_s3_bucket" "myS3Bucket" {
  bucket = "${var.s3-bucket-name}"
  acl    = "public-read"

  tags {
    Name        = "My Terraform EB Dev-Challenge Bucket"
    Environment = "Dev"
  }
}

#Upload index.html file to S3 bucket
resource "aws_s3_bucket_object" "indexObject" {
  bucket       = "${var.s3-bucket-name}"
  key          = "index.html"
  source       = "/Users/TravisLaxson/Terraform/code/terraform-learning/Beanstalk-S3-Env/index.html"
  acl          = "public-read"
  content_type = "text/html"
  etag         = "${md5(file("/Users/TravisLaxson/Terraform/code/terraform-learning/Beanstalk-S3-Env/index.html"))}"
  depends_on   = ["aws_s3_bucket.myS3Bucket"]
}

#Upload error.html file to S3 bucket
resource "aws_s3_bucket_object" "errorObject" {
  bucket       = "${var.s3-bucket-name}"
  key          = "error.html"
  source       = "/Users/TravisLaxson/Terraform/code/terraform-learning/Beanstalk-S3-Env/error.html"
  acl          = "public-read"
  content_type = "text/html"
  etag         = "${md5(file("/Users/TravisLaxson/Terraform/code/terraform-learning/Beanstalk-S3-Env/error.html"))}"
  depends_on   = ["aws_s3_bucket.myS3Bucket"]
}
