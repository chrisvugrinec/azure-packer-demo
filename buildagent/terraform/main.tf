resource "azurerm_resource_group" "rg" {
  name     = "${var.rg}"
  location = "${var.location}"
}

module "network" {
  source = "./network"
  rg = "${azurerm_resource_group.rg.name}"
  vnet = "${var.vnet}"
  subnet = "${var.subnet}"
}

module "vm1" {
  source = "./vm1"
  pat = "${var.PAT}"
  ssh = "${var.SSH}"
  rg = "${azurerm_resource_group.rg.name}"
  vnet = "${var.vnet}"
  subnet = "${var.subnet}"
  keyvault = "devops-kv-${random_string.random-namespace.result}"
}
