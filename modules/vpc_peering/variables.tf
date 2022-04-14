variable "peer_env" {
    default     = ["nonprod","prod"]
    type=list(string)
    
}
variable "prod_cidr" {
  type        = string
  description = "cidr block for peering"  
}
variable "nonprod_cidr" {
  type        = string
  description = "cidr block for peering"
}

variable "env" {
    type=string
    
}