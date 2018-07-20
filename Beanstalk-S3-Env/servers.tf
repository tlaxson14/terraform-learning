#Create beanstalk application environment
resource "aws_elastic_beanstalk_environment" "TLaxson-App" {
  name                = "${var.elastic-beanstalk-name}"
  application         = "${aws_elastic_beanstalk_application.TLaxson-App.name}"
  solution_stack_name = "${var.app-stack}"
  tier                = "${var.app-tier}"
}

resource "aws_elastic_beanstalk_application" "TLaxson-App" {
  name        = "${var.elastic-beanstalk-name}"
  description = "EB-Author-Travis-Laxson"
}

resource "aws_elastic_beanstalk_application_version" "TLaxson-App" {
  name        = "${var.elastic-beanstalk-name}"
  description = "Application version created with Terraform - Authored by Travis Laxson"
  application = "${aws_elastic_beanstalk_application.TLaxson-App.name}"
  bucket      = "${aws_s3_bucket.myS3Bucket.id}"
  key         = "${aws_s3_bucket_object.indexObject.id}"
  depends_on  = ["aws_s3_bucket.myS3Bucket"]
}
