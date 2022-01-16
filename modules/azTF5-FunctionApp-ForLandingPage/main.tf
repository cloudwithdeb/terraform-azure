/*
    (0). Resource Group To house mystorekeeper landingpage functions
*/


resource "azurerm_resource_group" "mystorekeeper-funcs" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}


/*
    (1). Application insight datasource
*/


data "azurerm_application_insights" "mystorekeeper-func-insight" {
  name                = var.APP-INSIGHT["NAME"]
  resource_group_name = var.APP-INSIGHT["RESOURCE_GROUP"]
}


/*
    (2). Storage Account For function app to
    store application codes during application
    deployment.
*/


resource "random_integer" "ri" {
  min = 066
  max = 890
}

resource "azurerm_storage_account" "mystorekeeper-storage-account" {
  name                     = "${var.STORAGE-ACCOUNT["NAME"]}${random_integer.ri.result}"
  resource_group_name      = azurerm_resource_group.mystorekeeper-funcs.name
  location                 = azurerm_resource_group.mystorekeeper-funcs.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


/*
    (2). Landing Page Function App Container
*/


resource "azurerm_storage_container" "mystorekeeper-container" {
  name                  = var.STORAGE-ACCOUNT["CONTAINER-NAME"]
  storage_account_name  = azurerm_storage_account.mystorekeeper-storage-account.name
  container_access_type = "private"
}


/*
    (3). Landing page Function App Consumption Environment Plan
*/


resource "azurerm_app_service_plan" "signup_mystorekeeper" {
  name                = var.FUNCTION-CONFIGS["APP_SERVICE_PLAN_NAME"]
  location            = azurerm_resource_group.mystorekeeper-funcs.location
  resource_group_name = azurerm_resource_group.mystorekeeper-funcs.name
  kind                = "FunctionApp"
  reserved            = true
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}


/*
    (4). Landing Page Function App Consumption Environment 
*/


resource "azurerm_function_app" "mystorekeeper-signup-func" {
  name                       = var.FUNCTION-CONFIGS["NAME"]
  location                   = azurerm_resource_group.mystorekeeper-funcs.location
  resource_group_name        = azurerm_resource_group.mystorekeeper-funcs.name
  app_service_plan_id        = azurerm_app_service_plan.signup_mystorekeeper.id
  storage_account_name       = azurerm_storage_account.mystorekeeper-storage-account.name
  storage_account_access_key = azurerm_storage_account.mystorekeeper-storage-account.primary_access_key
  https_only                 = true
  os_type                    = var.FUNCTION-CONFIGS["OS_TYPE"]
  version                    = "~3"
  identity {
    type = "SystemAssigned"
  }
  app_settings = {
    DEV_DB_NAME                    = "DEV_mystorekeeper"
    TEST_DB_NAME                   = "TEST_mystorekeeper"
    PROD_DB_NAME                   = "PROD_mystorekeeper"
    DEV_REGISTERED_USERS           = "DEV_REGISTERED_users"
    TEST_REGISTERED_USERS          = "TEST_REGISTERED_users"
    PROD_REGISTERED_USERS          = "PROD_REGISTERED_users"
    DEV_GUEST_USERS                = "DEV_ORG_GUEST_users_login"
    TEST_GUEST_USERS               = "TEST_ORG_GUEST_users_login"
    PROD_GUEST_USERS               = "PROD_ORG_GUEST_users_login"
    DEV_USERS_TABLE                = "DEV_ORG_USERS_table"
    TEST_USERS_TABLE               = "TEST_ORG_USERS_table"
    PROD_USERS_TABLE               = "PROD_ORG_USERS_table"
    DEV_PERMANENT_LOGIN_TABLE      = "DEV_ORG_PER_users_login"
    TEST_PERMANENT_LOGIN_TABLE     = "TEST_ORG_PER_users_login"
    PROD_PERMANENT_LOGIN_TABLE     = "PROD_ORG_PER_users_login"
    DEV_IMAGE_CONTAINER            = "dev-imageuploads"
    TEST_IMAGE_CONTAINER           = "test-imageuploads"
    PROD_IMAGE_CONTAINER           = "prod-imageuploads"
    STORAGE_ACCOUNT_NAME           = "mystorekeeperimglogs210"
    FUNCTIONS_WORKER_RUNTIME       = "python"
    KEYVAULT_NAME                  = "mystorekeeperkeyvault"
    SECRET_NAME                    = "mystorekeeper-conn-strings"
    DEV_BRANCHES_NAME              = "DEV_ORG_branches"
    TEST_BRANCHES_NAME             = "TEST_ORG_branches"
    PROD_BRANCHES_NAME             = "PROD_ORG_branches"
    APPINSIGHTS_INSTRUMENTATIONKEY = data.azurerm_application_insights.mystorekeeper-func-insight.instrumentation_key
  }

  site_config {
    linux_fx_version = "Python|3.8"
    always_on        = false
    cors {
      allowed_origins = ["*"]
    }
  }
}

