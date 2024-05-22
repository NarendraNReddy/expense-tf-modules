# variable "project_name" {
#   type=string 
# }

variable "project_name" {
  default = "expense"
}

# variable "environment" {
#   type = string 
#   default = "dev"
# }

variable "environment" {
  default = "dev"
}

# variable "sg_name" {
#   type = string

# }



# variable "sg_description" {
#   default = string
# }

# variable "db_sg_desription" {
#   default = "SG for DB MySQL Instances"
# }

# variable "vpc_id" {
#   type = string
# }

variable "common_tags" {
  default = {
    Project="expense"
    Environment="dev"
    Terraform=true
  }
}

variable "sg_tags" {
  type = map 
  default = {}
}

