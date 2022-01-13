
/*
    (1). Create resource group for
    mystorekeeper appconfigs
*/


resource "azurerm_resource_group" "mystorekeeper-rg" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}


/*
    (2). Create appconfig for
    mystorekeeper applications.
*/


resource "azurerm_app_configuration" "appconf" {
  name                = var.APP-CONFIGS["NAME"]
  resource_group_name = azurerm_resource_group.mystorekeeper-rg.name
  location            = azurerm_resource_group.mystorekeeper-rg.location
  sku                 = var.APP-CONFIGS["SKU"]
}


/*
    (3). Create appconfig configuration
    key by passing cosmosdb connection
    strings into it.
*/


resource "azurerm_app_configuration_key" "test" {
  configuration_store_id = azurerm_app_configuration.appconf.id
  key                    = var.APPCONFIG-KEY-VALUE["KEY"]
  value                  = var.APPCONFIG-KEY-VALUE["VALUE"]

  depends_on = [
    azurerm_app_configuration.appconf
  ]
}