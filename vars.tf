variable "default_tags" {
  type = map(string)
  default = {
    "env" = "anthonym"
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

variable "sg_db_ingress" {
  type = map(object({
    port     = number
    protocol = string
    self     = bool
  }))
  default = {
    "mysql" = {
      port     = 3306
      protocol = "tcp"
      self     = true
    }
  }
}

variable "sg_db_engress" {
  type = map(object({
    port     = number
    protocol = string
    self     = bool
  }))
  default = {
    "all" = {
      port     = 0
      protocol = "-1"
      self     = true
    }
  }
}

variable "db_credentials" {
  type      = map(any)
  sensitive = true
  default = {
    username = "username"
    password = "password"
  }
}
