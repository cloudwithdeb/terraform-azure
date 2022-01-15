

/*
    This terraform configuration contains terraform
    configuration codes to deploy resource group, 
    application insight, storage account, appservice
    plan and app service serverless environment for
    mystorekeeper landing page functionalities.
*/


/*
    (0). Resource Group To house mystorekeeper landingpage functions
*/


resource "azurerm_resource_group" "mystorekeeper-funcs" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}



/*
    (2). Application Insight For Function Apps
*/


resource "azurerm_application_insights" "mystorekeeper-func-insight" {
  name                = "mystorekeeper-funcs-insight"
  location            = azurerm_resource_group.mystorekeeper-funcs.location
  resource_group_name = azurerm_resource_group.mystorekeeper-funcs.name
  application_type    = "web"
}



/*
    (3). Storage Account For function app to
    store application codes during application
    deployment.
*/



resource "azurerm_storage_account" "mystorekeeper-storage-account" {
  name                     = "${local.az-lower}${var.storage-bucket[0]}"
  resource_group_name      = azurerm_resource_group.mystorekeeper-funcs.name
  location                 = azurerm_resource_group.mystorekeeper-funcs.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mystorekeeper-container" {
  name                  = "mystorekeeper-func-files"
  storage_account_name  = azurerm_storage_account.mystorekeeper-storage-account.name
  container_access_type = "private"
}


/*
    (5). Signup Function App Consumption Environment Plan
*/


resource "azurerm_app_service_plan" "signup_mystorekeeper" {
  name                = "${local.az}${var.app-service[0]}"
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
    (7). Signup Function App Consumption Environment 
*/


resource "azurerm_function_app" "mystorekeeper-signup-func" {
  name                       = "${local.az}${var.func-names[0]}"
  location                   = azurerm_resource_group.mystorekeeper-funcs.location
  resource_group_name        = azurerm_resource_group.mystorekeeper-funcs.name
  app_service_plan_id        = azurerm_app_service_plan.signup_mystorekeeper.id
  storage_account_name       = azurerm_storage_account.mystorekeeper-storage-account.name
  storage_account_access_key = azurerm_storage_account.mystorekeeper-storage-account.primary_access_key
  https_only                 = true
  os_type                    = "linux"
  version                    = "~3"
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
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.mystorekeeper-func-insight.instrumentation_key
  }

  site_config {
    linux_fx_version = "Python|3.8"
    always_on        = false
    cors {
      allowed_origins = ["*"]
    }
  }
}

