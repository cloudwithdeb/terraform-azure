

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
    (3). Defien functionapp variable configurations
*/


variable "FUNCTION-CONFIGS" {
  type = object({
    NAME                  = string
    OS_TYPE               = string
    APP_SERVICE_PLAN_NAME = string
  })
}


/*
    (4). Define application insight variable configurations
*/


variable "APP-INSIGHT" {
  type = object({
    NAME           = string
    RESOURCE_GROUP = string
  })
}


/*
    (4). Define storage account variable configurations
*/


variable "STORAGE-ACCOUNT" {
  type = object({
    NAME           = string
    RESOURCE_GROUP = string
    CONTAINER-NAME = string
  })
}
