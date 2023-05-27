output "vnet-name" {
  value = azurerm_virtual_network.vnet.name
}

output "nics" {
  value = azurerm_network_interface.netowrk-interface[*].id
}
