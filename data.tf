//this is to connect the VPC information , this can be done by accessing VPC state file which
// is stored in s3
data "terraform_remote_state" "vpc" {
  backend        = "s3"
  config         = {
    bucket       = var.bucket //existing bucket name to access VPC state files
    key          = "vpc/${var.ENV}/terraform.tfstate" //path in bucket
    region       = var.region
  }
}

//data "terraform_remote_state" "frontend" {
//  backend        = "s3"
//  config         = {
//    bucket       = var.bucket //existing bucket name to access VPC state files
//    key          = "frontend/${var.ENV}/terraform.tfstate" //path in bucket
//    region       = var.region
//  }
//}