

/*
    (1). Create resource group for
    mystorekeeper application database
    which is cosmosdb.
*/


resource "azurerm_resource_group" "mystorekeeper-rg" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}


/*
    (2). Create a cosmosdb account
    with mongodb api serverless option
    for mystorekeeper application.
*/


resource "random_integer" "ri" {
  min = 110
  max = 890
}

resource "azurerm_cosmosdb_account" "db" {

  name                      = "${var.COSMOSDB_CONFIGS["NAME"]}-${random_integer.ri.result}"
  location                  = azurerm_resource_group.mystorekeeper-rg.location
  resource_group_name       = azurerm_resource_group.mystorekeeper-rg.name
  offer_type                = var.COSMOSDB_CONFIGS["OFFER_TYPE"]
  kind                      = var.COSMOSDB_CONFIGS["KIND"]
  enable_automatic_failover = var.COSMOSDB_CONFIGS["AUTOMATIC_FAILOVER"]
  mongo_server_version      = var.COSMOSDB_CONFIGS["SERVER_VERSION"]

  capabilities {
    name = var.CAPABILITIY_NAMES[0]
  }

  capabilities {
    name = var.CAPABILITIY_NAMES[1]
  }

  capabilities {
    name = var.CAPABILITIY_NAMES[2]
  }

  capabilities {
    name = var.CAPABILITIY_NAMES[3]
  }

  consistency_policy {
    consistency_level = var.COSMOSDB_CONFIGS["CONSISTENCY_POLICY"]
  }

  geo_location {
    location          = azurerm_resource_group.mystorekeeper-rg.location
    failover_priority = var.COSMOSDB_CONFIGS["FAILOVER_PRIORITY"]
  }

}

