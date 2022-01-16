

/*
    (0). Resource Group To house mystorekeeper landingpage functions
*/


resource "azurerm_resource_group" "mystorekeeper-appinsight" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}



/*
    (2). Application Insight For Function Apps
*/


resource "azurerm_application_insights" "mystorekeeper-func-insight" {
  name                = var.APP-INSIGHT["NAME"]
  location            = azurerm_resource_group.mystorekeeper-appinsight.location
  resource_group_name = azurerm_resource_group.mystorekeeper-appinsight.name
  application_type    = var.APP-INSIGHT["APPLICATION_TYPE"]
}


