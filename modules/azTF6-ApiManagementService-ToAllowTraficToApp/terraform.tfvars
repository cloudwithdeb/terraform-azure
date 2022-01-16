

/*
    (1). Assign values to subscription variable
*/


SUBSCRIPTION = "c59b9197-a8b5-4c1d-9196-b5c8bc9be3cf"



/*
    (2). Assign values to RESOURCE_GROUP
*/


RESOURCE_GROUP = {
  NAME     = "azMystoreKeeperAPImanagentRG"
  LOCATION = "West Europe"
}


/*
    (3). aSSIGN VALUES TO APIGATEWAY-MANAGEMENT variable
*/


APIGATEWAY-MANAGEMENT-LOGANALYTICS = {
  ANALYTICS_WORKSPACE_NAME = "azMystorekeeperAPIManagementLogAnalyticsWorkspace"
  ANALYTICS_SKU            = "PerGB2018"
  RETENTION_DAYS           = 30
}


/*
    (4) Assign values to APIGATEWAY-ANALYTICS variable
*/


APIGATEWAY-APP-INSIGHT = {
  NAME             = "azMystorekeeperAppInsight"
  APPLICATION_TYPE = "web"
}


/*
    (5). Aassign values to APIGATEWAY-MANAGEMENT variable
*/


APIGATEWAY-MANAGEMENT = {
  NAME            = "azMystorekeeperAPImanagement"
  PUBLISHER_NAME  = "Owusu Bright Debrah"
  PUBLISHER_EMAIL = "owusubrightdebrah@gmail.com"
  SKU_NAME        = "Consumption_0"
  LOGER_NAME      = "azMystorekeeperApiManagementLogger"
}
