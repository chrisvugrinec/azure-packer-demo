data "azurerm_resource_group" "network-rg"{
  name = "${var.rg}"
}

resource "azurerm_virtual_network" "devopsvnet" {
  name                = "${var.vnet}"
  address_space       = ["10.0.0.0/16"]
  location            = "${data.azurerm_resource_group.network-rg.location}"
  resource_group_name = "${data.azurerm_resource_group.network-rg.name}"
}

resource "azurerm_subnet" "devopssubnet" {
  name                 = "${var.subnet}"
  resource_group_name  = "${data.azurerm_resource_group.network-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.devopsvnet.name}"
  address_prefix       = "10.0.2.0/24"
}
