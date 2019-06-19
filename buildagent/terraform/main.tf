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

module "keyvault" {
  source = "./keyvault"
  tenant_id = "${var.TENANT_ID}"
  object_id = "${var.OBJECT_ID}"
  rg = "${azurerm_resource_group.rg.name}"
  keyvault = "devops-kv-${random_string.random-namespace.result}"
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
