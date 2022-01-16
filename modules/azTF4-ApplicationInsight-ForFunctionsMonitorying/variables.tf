

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
    (3). Define application insight configurations
*/


variable "APP-INSIGHT" {
  type = object({
    NAME             = string
    APPLICATION_TYPE = string
  })
}
