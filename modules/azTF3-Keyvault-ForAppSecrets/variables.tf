

/*
    (1). Setup terraform subscription variable
*/


variable "SUBSCRIPTION" {
  type        = string
  description = "account subscription id"
}


/*
    (2). Define resource group name
*/


variable "RESOURCE_GROUP" {
  type = object({
    NAME     = string
    LOCATION = string
  })
  description = "Define resource group name and location"
}


/*
    (3). Define keyvault variables
*/


variable "AZURE-KEY-VAULT" {
  type = object({
    NAME                       = string
    SKU_NAME                   = string
    ENABLE_DISK_ENCRYPTION     = bool
    PURGE_PROTECTION_ENABLE    = bool
    SOFT_DELETE_RETENTION_DAYS = number
    TERNANT_ID                 = string
  })
  description = "Azure key vault configuration"
}


/*
    (4). Define secrets to upload variables
*/


variable "KEYVAULT-SECRETS-MONGODB-URL" {
  type = object({
    SECRETS_KEY   = string
    SECRETS_VALUE = string
  })
}


/*
    (5). Define Algorithm to be used for login 
*/

variable "KEYVAULT-SECRETS-ALGORITHM" {
  type = object({
    SECRETS_KEY   = string
    SECRETS_VALUE = string
  })
}


/*
    (6). Define secret used for login
*/

variable "KEYVAULT-SECRETS-SECRETS-KEY" {
  type = object({
    SECRETS_KEY   = string
    SECRETS_VALUE = string
  })
}

/*
    (7). Define expired date for login
*/


variable "KEYVAULT-SECRETS-EXPIRED-DATE" {
  type = object({
    SECRETS_KEY   = string
    SECRETS_VALUE = number
  })
}
