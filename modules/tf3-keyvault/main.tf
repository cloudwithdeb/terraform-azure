
/*
    (0). Get azure client_id, ternant_id,
         object_id and subscription_id.
*/

data "azurerm_client_config" "current" {}


/*
    (0). Create resource group for
    mystorekeeper storage account
*/


resource "azurerm_resource_group" "mystorekeeper-keyvault-rg" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}


/*
    (1). Create azure keyvault resource for
    mystorekeeper application
*/


resource "azurerm_key_vault" "mystorekeeper-keyvault" {
  name                        = var.AZURE-KEY-VAULT["NAME"]
  tenant_id                   = var.AZURE-KEY-VAULT["TERNANT_ID"]
  location                    = azurerm_resource_group.mystorekeeper-keyvault-rg.location
  resource_group_name         = azurerm_resource_group.mystorekeeper-keyvault-rg.name
  enabled_for_disk_encryption = var.AZURE-KEY-VAULT["ENABLE_DISK_ENCRYPTION"]
  soft_delete_retention_days  = var.AZURE-KEY-VAULT["SOFT_DELETE_RETENTION_DAYS"]
  purge_protection_enabled    = var.AZURE-KEY-VAULT["PURGE_PROTECTION_ENABLE"]
  sku_name                    = var.AZURE-KEY-VAULT["SKU_NAME"]
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set",
      "List"
    ]

  }
}


/*
    (2). Add secrets to vault
*/


resource "azurerm_key_vault_secret" "addsecrets-to-keyvault" {
  name         = var.KEYVAULT-SECRETS["SECRETS_KEY"]
  value        = var.KEYVAULT-SECRETS["SECRETS_VALUE"]
  key_vault_id = azurerm_key_vault.mystorekeeper-keyvault.id
}
