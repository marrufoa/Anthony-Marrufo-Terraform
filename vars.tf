variable "default_tags" {
  type = map(string)
  default = {
    "env" = "terraform-anthonym"
  }
  description = "anthonym variable description"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Main VPC CIDR block"
}

variable "private_subnet_count" {
  type        = number
  description = "Pivate subnet count description"
  default     = 2
}

variable "public_subnet_count" {
  type        = number
  description = "public subnet count description"
  default     = 2
}
