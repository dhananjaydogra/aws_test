# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Dhananjay",
    "App"   = "Web"
  }
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

# Name prefix
variable "prefix" {
  type        = string
  default     = "Assgn2"
  description = "Name prefix"
}

# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "VPC to host static web site"
}

variable "private_subnet_cidrs" {
  default     = ["10.100.3.0/24", "10.100.4.0/24"]
  type        = list(string)
  description = "Non Prod Private Subnet CIDRs"
}


# Variable to signal the current environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}

