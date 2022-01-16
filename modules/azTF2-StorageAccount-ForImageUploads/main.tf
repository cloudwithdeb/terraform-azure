

/*
    (0). Create resource group for
    mystorekeeper storage account
*/


resource "azurerm_resource_group" "mystorekeeper-storage-account-rg" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}


/*
    (1). Azure storage account for mystorekeeper
    image uploads and user logs to table storage.
*/

resource "random_integer" "ri" {
  min = 110
  max = 890
}

resource "azurerm_storage_account" "storage-accounts-images-logs" {
  name                      = "${var.STORAGE-ACCOUNT-LOGS-IMAGEUPLOAD-NAMES}${random_integer.ri.result}"
  resource_group_name       = azurerm_resource_group.mystorekeeper-storage-account-rg.name
  location                  = azurerm_resource_group.mystorekeeper-storage-account-rg.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "GRS"
  enable_https_traffic_only = true
  allow_blob_public_access = true
  blob_properties {
    cors_rule {
      allowed_origins    = ["*"]
      allowed_methods    = ["DELETE", "GET", "HEAD", "POST", "OPTIONS", "PUT"]
      allowed_headers    = ["DELETE", "GET", "HEAD", "POST", "OPTIONS", "PUT"]
      exposed_headers    = ["*"]
      max_age_in_seconds = 30
    }
    versioning_enabled = true
  }
}


/*
    (2). Define storage account container
*/


resource "azurerm_storage_container" "mystorekeeper-container" {
  for_each = toset(var.IMAGE-LOGS-STORAGE-ACCOUNT)
  name                  = each.key
  storage_account_name  = azurerm_storage_account.storage-accounts-images-logs.name
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.storage-accounts-images-logs
  ]
}