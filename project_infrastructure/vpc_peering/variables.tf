variable "peer_env" {
  default = ["nonprod", "prod"]
  type    = list(string)

}
variable "prod_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "cidr block for peering"
}
variable "nonprod_cidr" {
  default     = "10.1.0.0/16"
  type        = string
  description = "cidr block for peering"
}

variable "env" {
  default = "prod"
  type    = string

}