output "resource_group_name" {
  description = "name of resource group"
  value       = "${azurerm_resource_group.rg.id}"
}

output "virtual_network_name" {
  description = "name of virtual network created in resource group"
  value       = "${azurerm_virtual_network.net.id}"
}

output "virtual_network_subnets" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_subnet.subnet.*.name}"
}
