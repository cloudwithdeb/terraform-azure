

/*
    (1). Setup terraform subscription variable
*/


variable "SUBSCRIPTION" {
  type        = string
  description = "account subscription id"
}


/*
    (2). Define storage account names
*/

variable "STORAGE-ACCOUNT-LOGS-IMAGEUPLOAD-NAMES" {
  type        = string
  description = "Azure storage account FOR images and logs names"
}


/*
    (3). Storage account container
*/


variable "IMAGE-LOGS-STORAGE-ACCOUNT" {
  type = list(string)
  description = "Storage account container for image and uploads"
}


/*
    (4). Define resource group name
*/


variable "RESOURCE_GROUP" {
  type = object({
    NAME     = string
    LOCATION = string
  })
}
