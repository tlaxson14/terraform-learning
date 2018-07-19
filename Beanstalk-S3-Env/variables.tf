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
  default = "TLaxson-VPC"
  description = "Default tag name of VPC"
}

variable "igw-tagname" {
  default = "TLaxson-IGW"
  description = "Default tag name of IGW"
}

variable "route-table-tagname" {
  default = "TLaxson-Public-RT"
  description = "New public network route table"
}

variable "route1-cidr" {
  default = "10.0.1.0/24"
}
