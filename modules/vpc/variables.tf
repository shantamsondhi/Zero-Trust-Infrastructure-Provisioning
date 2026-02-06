variable "env" { 
    type = string 
}
variable "vpc_cidr" {
     type = string
}
variable "azs" {
     type = list(string) 
}
variable "private_subnets" { 
    type = list(string) 
}
variable "db_subnets" {
     type = list(string) 
}