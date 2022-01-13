

/*
    (1). Setup terraform subscription variable
*/


variable "SUBSCRIPTION" {
  type        = string
  description = "account subscription id"
}


/*
    (2). Define resource group name for appconfigs
*/


variable "RESOURCE_GROUP" {
  type = object({
    NAME     = string
    LOCATION = string
  })
  description = "resource group for appconfig for mystorekeeper applications"
}


/*
    (3). App config configurations variable
*/


variable "APP-CONFIGS" {
  type = object({
    NAME = string
    SKU  = string
  })
  description = "appconfig configurations"
}


/*
    (4). App config secrets values
*/


variable "APPCONFIG-KEY-VALUE" {
  type = object({
    KEY   = string
    VALUE = string
  })
  description = "values to be passed to app config"
}
