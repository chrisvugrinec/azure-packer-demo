data "azurerm_resource_group" "kv-rg"{
  name = "${var.rg}"
}

# keyvault
resource "azurerm_key_vault" "devops-kv" {
  name                        = "${var.keyvault}"
  location                    = "${data.azurerm_resource_group.kv-rg.location}"
  resource_group_name         = "${data.azurerm_resource_group.kv-rg.name}"
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  tenant_id                   = "${var.tenant_id}"

  sku {
    name = "standard"
  }

  # if you are not creating a SP find this data with the following commands
  # tenant id: az account show
  # object id: az ad signed-in-user show | grep objectId
  # This is the object ID of the ENTERPRISE APP!!!
  access_policy {
    tenant_id = "${var.tenant_id}"
    object_id = "${var.object_id}"

    key_permissions = [
      "get","list","create","delete"
    ]

    secret_permissions = [
      "get","list","set","delete"
    ]
  }

  # Change this to Deny, for limited network access
  network_acls {
    default_action             = "Allow"
    bypass                     = "AzureServices"
  }
}

