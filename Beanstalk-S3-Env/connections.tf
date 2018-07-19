#Create AWS environment in default region
#Setup user access to cloud environment with IAM keys
provider "aws" {
  region = "${var.region}"
  #access_key = "${var.access-key}"
  #secret_key = "${var.secret-key}"
}
