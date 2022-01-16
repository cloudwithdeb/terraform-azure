

/*
    (1). Assign values to subscription variable
*/


SUBSCRIPTION = "c59b9197-a8b5-4c1d-9196-b5c8bc9be3cf"


/*
    (2). Assign values to RESOURCE_GROUP
*/


RESOURCE_GROUP = {
  NAME     = "azMystoreKeeperLandingPageFunctionAppRG"
  LOCATION = "West Europe"
}


/*
    (3). Assign values to function-configs app
*/


FUNCTION-CONFIGS = {
  NAME                  = "azLandingPageFunctionAppService"
  OS_TYPE               = "linux"
  APP_SERVICE_PLAN_NAME = "azLandingPageFunctionAppPlan"
}


/*
    (3). Assign values to APP-INSIGHT variable
*/


APP-INSIGHT = {
  NAME           = "mystorekeeper-funcs-app-insight"
  RESOURCE_GROUP = "azMystorekeeperAppInsightsRG"
}


/*
    (4). Assign values to storage account
*/


STORAGE-ACCOUNT = {
  NAME           = "mystorekeeperlandpg"
  CONTAINER-NAME = "landingpage"
  RESOURCE_GROUP = "azMystoreKeeperLandingPageFunctionAppRG"
}
