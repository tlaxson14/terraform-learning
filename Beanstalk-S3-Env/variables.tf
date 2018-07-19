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

variable "cidr-block" {
  default = "10.0.0.0/16"
  description = "Default cidr block range for VPC"
}

variable "vpc-tagname" {
  default = "TBLaxson-VPC"
  description = "Default tag name of VPC"
}
