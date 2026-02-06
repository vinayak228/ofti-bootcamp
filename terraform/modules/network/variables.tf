variable "resource_group_name" {}
variable "location" {}

variable "vnet_name" {
  default = "main-vnet"
}

variable "vnet_cidr" {
  default = "10.0.0.0/16"
}

variable "aks_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  default = "10.0.2.0/24"
}
