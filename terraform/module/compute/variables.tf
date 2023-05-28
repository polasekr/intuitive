#variable "name" {}
variable "vm-count" {}
variable "resource_group_name" {}
variable "location" {}
variable "nics" {}
variable "vm_size" {
  default = "Standard_DS1_v2"
}
variable "vm_username" {
  default = "azureuser"
}
variable "custom_data_override" {
  default = ""
}
