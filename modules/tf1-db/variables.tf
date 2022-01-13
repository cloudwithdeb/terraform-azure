

/*
    (1). Setup terraform subscription variable
*/


variable "SUBSCRIPTION" {
  type        = string
  description = "account subscription id"
}


/*
    (2). Define cosmosdb resource group configurations.
*/


variable "RESOURCE_GROUP" {
  type = object({
    NAME     = string
    LOCATION = string
  })
}


/*
    (3). Define cosmosdb database configurations
*/


variable "COSMOSDB_CONFIGS" {
  type = object({
    NAME               = string
    OFFER_TYPE         = string
    KIND               = string
    BACKUP_TYPE        = string
    STORAGE_REDUNDANCY = string
    CONSISTENCY_POLICY = string
    FAILOVER_PRIORITY  = number
    SERVER_VERSION     = string
    AUTOMATIC_FAILOVER = bool
  })
  description = "Cosmosdb configurations for mystorekeeper"
}


/*
    (4). Define cosmosdb capabilities names
*/


variable "CAPABILITIY_NAMES" {
  type        = list(string)
  description = "A list containing all mongodb capabilities configurations"
}
