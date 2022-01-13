

/*
    (1). Assign values to subscription variable
*/


SUBSCRIPTION = "c59b9197-a8b5-4c1d-9196-b5c8bc9be3cf"


/*
    (2). Assign values to resource group name
*/


RESOURCE_GROUP = {
  LOCATION = "West Europe"
  NAME     = "azMyStoreKeeperCosmosdbRG"
}


/*
    (3). Assign values to capabilities name
*/


COSMOSDB_CONFIGS = {
  NAME               = "mystorekeeperdb"
  OFFER_TYPE         = "Standard"
  KIND               = "MongoDB"
  BACKUP_TYPE        = "Periodic"
  STORAGE_REDUNDANCY = "Zone"
  CONSISTENCY_POLICY = "Strong"
  FAILOVER_PRIORITY  = 0
  SERVER_VERSION     = "4.0"
  AUTOMATIC_FAILOVER = true
}


/*
    (4). Assign values to cosmodb capabilities variable
*/


CAPABILITIY_NAMES = [
  "EnableServerless",
  "mongoEnableDocLevelTTL",
  "EnableMongo",
  "EnableAggregationPipeline"
]
