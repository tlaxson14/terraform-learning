variable "region" {
  default = "us-east-1"
  description = "Default region for VPC network"
}

#variable "secret-key" {
#  description = "Secret key provided to AWS user through IAM"
#}

#variable "access-key" {
#  description = "Access key provided to AWS through IAM"
#}

variable "elastic-beanstalk-name" {
  default = "tlaxson-elastic-beanstalk-app"
  description = "Name of Elastic Beanstalk application"
}

variable "s3BucketName" {
  default = "tlaxson-terraform-dev-bucket"
  description = "Name of S3 bucket"
}

variable "app-tier" {
  default = "WebServer"
  description = "Environment tier of Elastic Beanstalk"
}

variable "app-stack" {
  default = "64bit Amazon Linux 2018.03 v4.5.1 running Node.js"
  description = "Solution stack of Elastic Beanstalk environment"
}
