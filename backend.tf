terraform {  backend "s3" {}}
provider "aws" {  
    region  = "${var.region}"  
    version = "2.70.0"
    }