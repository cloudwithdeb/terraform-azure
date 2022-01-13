
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
