variable "env" {
     type = string
}
variable "vpc_id" {
     type = string
}
variable "subnet_ids" {
     type = list(string) 
}
variable "cluster_role_arn" {
     type = string 
}