# This module will create a resource group and all basic resources like :
# - Virtual Network 
# - Subnet 
# - Storage Account (when needed)

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.tf_az_env}-${var.tf_az_name}-rg"
  location = "${var.tf_az_location}"
  tags     = "${var.tf_az_tags}"
}

# Create Virtual Network in the Resource Group
resource "azurerm_virtual_network" "net" {
  name                = "${var.tf_az_env}-${var.tf_az_name}-net"
  location            = "${var.tf_az_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["${var.tf_az_net_addr_space}"]
  dns_servers         = "${var.tf_az_dns_servers}"
  tags                = "${var.tf_az_tags}"
}

# Create subnets attached to Virtual Network
resource "azurerm_subnet" "subnet" {
  name                 = "${var.tf_az_env}-${var.tf_az_name}-${var.tf_az_subnet_names[count.index]}"
  virtual_network_name = "${azurerm_virtual_network.net.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.tf_az_subnet_prefixes[count.index]}"
  count                = "${length(var.tf_az_subnet_names)}"
}

# Create Storage Account inside Resource Group
resource "azurerm_storage_account" "storageaccount" {
  name                     = "${lower(var.tf_az_storage_account_name)}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${var.tf_az_location}"
  account_tier             = "${var.tf_az_storage_account_tier}"
  account_replication_type = "${var.tf_az_storage_account_repl}"
  tags                     = "${var.tf_az_tags}"
}
