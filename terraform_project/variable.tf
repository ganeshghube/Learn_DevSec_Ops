variable "project_name" {
  type = string
}

variable "project_env" {
  type = string
}

variable "cidr_block" {
  #type = string
}

variable "public_cidr" {
  type = list(any)
}

variable "private_cidr" {
  type = list(any)
}

variable "region" {
  #type = string
}

variable "availability_zones" {
  type        = list(any)
  description = "The names of the availability zones to use"
}