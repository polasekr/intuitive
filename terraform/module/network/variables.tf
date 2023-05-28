variable "name" {}
variable "address_space" {}
variable "location" {}
variable "resource_group_name" {}
variable "common-tags" {}
variable "address_prefixes" {}
variable "vm-count" {}
variable "inboud_ports" {
  type    = map(any)
  default = {}
}
