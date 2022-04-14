terraform {
  backend "s3" {
    bucket = "prod-acs730-assignment"         // Bucket where to SAVE Terraform State
    key    = "vpc_peering/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                         // Region where bucket is created
  }
}