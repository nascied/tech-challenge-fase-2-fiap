variable "rds" {
  type = object({
    rds_properties = list(object({
      name    = string
      db_name = string
      db_user = string
      db_pass = string
    }))
  })
}

variable "aws_subnet_ids" {
  type = list(string)
}