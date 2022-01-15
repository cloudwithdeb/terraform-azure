

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


resource "azurerm_resource_group" "cloudhams-funcs" {
  name     = ""
  location = var.global["region"]
}



/*
    (2). Application Insight For Function Apps
*/


resource "azurerm_application_insights" "mystorekeeper-func-insight" {
  name                = "cloudhams-func-insight"
  location            = azurerm_resource_group.cloudhams-funcs.location
  resource_group_name = azurerm_resource_group.cloudhams-funcs.name
  application_type    = "web"
}



/*
    (3). Storage Account For function app to
    store application codes during application
    deployment.
*/



resource "azurerm_storage_account" "cloudhams-storage-account" {
  name                     = "${local.az-lower}${var.storage-bucket[0]}"
  resource_group_name      = azurerm_resource_group.cloudhams-funcs.name
  location                 = azurerm_resource_group.cloudhams-funcs.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "cloudhams-container" {
  name                  = "cloudhams-func-files"
  storage_account_name  = azurerm_storage_account.cloudhams-storage-account.name
  container_access_type = "private"
}


/*
    (5). Signup Function App Consumption Environment Plan
*/


resource "azurerm_app_service_plan" "signup_cloudhams" {
  name                = "${local.az}${var.app-service[0]}"
  location            = azurerm_resource_group.cloudhams-funcs.location
  resource_group_name = azurerm_resource_group.cloudhams-funcs.name
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


resource "azurerm_function_app" "cloudhams-signup-func" {
  name                       = "${local.az}${var.func-names[0]}"
  location                   = azurerm_resource_group.cloudhams-funcs.location
  resource_group_name        = azurerm_resource_group.cloudhams-funcs.name
  app_service_plan_id        = azurerm_app_service_plan.signup_cloudhams.id
  storage_account_name       = azurerm_storage_account.cloudhams-storage-account.name
  storage_account_access_key = azurerm_storage_account.cloudhams-storage-account.primary_access_key
  https_only                 = true
  os_type                    = "linux"
  version                    = "~3"
  app_settings = {
    PRIMARY_CONNECTION_STRING      = data.azurerm_storage_account.cloudhams-image.primary_connection_string
    COSMOSDB_url                   = var.db["COSMOSDB_url"]
    DATABASE                       = var.db["DATABASE"]
    HOSPITAL_users                 = var.db["HOSPITAL_users"]
    FUNCTIONS_WORKER_RUNTIME       = "python"
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.cloudhams-func-insight.instrumentation_key
  }

  site_config {
    linux_fx_version = "Python|3.8"
    always_on        = false
    cors {
      allowed_origins = ["*"]
    }
  }
  tags = {
    deployed-by = "Owusu Bright Debrah"
    role        = "Cloud Engineer"
    contact     = "0548433878"
    email       = "owusubrightdebrah@gmail.com"
    purpose     = "Function app for signup"
  }
}

