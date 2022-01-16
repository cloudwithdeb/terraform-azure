

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
    (3). Define apigateway log analytics variables
*/


variable "APIGATEWAY-MANAGEMENT-LOGANALYTICS" {
  type = object({
    ANALYTICS_WORKSPACE_NAME = string
    ANALYTICS_SKU            = string
    RETENTION_DAYS           = number
  })
  description = "API gateway management log analytics variable"
}


/*
    (4). Define log analytics insight variables
*/


variable "APIGATEWAY-APP-INSIGHT" {
  type = object({
    NAME             = string
    APPLICATION_TYPE = string
  })
  description = "Define apigateway management application insight"
}


/*
    (5). Define apigateway management variables
*/


variable "APIGATEWAY-MANAGEMENT" {
  type = object({
    NAME            = string
    PUBLISHER_NAME  = string
    PUBLISHER_EMAIL = string
    SKU_NAME        = string
    LOGER_NAME      = string
  })
  description = "Define apigateway management configurations"
}
