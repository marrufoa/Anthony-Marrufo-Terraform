variable "default_tags" {
  type = map(string)
  default = {
    "env" = "terraform-anthonym"
  }
  description = "anthonym variable description"
}
