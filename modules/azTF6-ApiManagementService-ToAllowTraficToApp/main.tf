

/*
    (0). Resource Group for apimanagement
*/


resource "azurerm_resource_group" "mystroekeeper-apimanagement-rg" {
  name     = var.RESOURCE_GROUP["NAME"]
  location = var.RESOURCE_GROUP["LOCATION"]
}


/*
    (1). Create log analytic workspace for apigateway
*/


resource "azurerm_log_analytics_workspace" "apigateway-app-insight-log-workspace" {
  name                = var.APIGATEWAY-MANAGEMENT-LOGANALYTICS["ANALYTICS_WORKSPACE_NAME"]
  location            = azurerm_resource_group.mystroekeeper-apimanagement-rg.location
  resource_group_name = azurerm_resource_group.mystroekeeper-apimanagement-rg.name
  sku                 = var.APIGATEWAY-MANAGEMENT-LOGANALYTICS["ANALYTICS_SKU"]
  retention_in_days   = var.APIGATEWAY-MANAGEMENT-LOGANALYTICS["RETENTION_DAYS"]
}


/*
    (2).Application Insight For API Gateway.
*/


resource "azurerm_application_insights" "mystroekeeper-apigateway-insight" {
  name                = var.APIGATEWAY-APP-INSIGHT["NAME"]
  location            = azurerm_resource_group.mystroekeeper-apimanagement-rg.location
  resource_group_name = azurerm_resource_group.mystroekeeper-apimanagement-rg.name
  workspace_id        = azurerm_log_analytics_workspace.apigateway-app-insight-log-workspace.id
  application_type    = var.APIGATEWAY-APP-INSIGHT["APPLICATION_TYPE"]
}


/*
    (3).mystroekeeper API Gateway Management
*/


resource "azurerm_api_management" "mystroekeeper-apigateway" {
  name                = var.APIGATEWAY-MANAGEMENT["NAME"]
  location            = azurerm_resource_group.mystroekeeper-apimanagement-rg.location
  resource_group_name = azurerm_resource_group.mystroekeeper-apimanagement-rg.name
  publisher_name      = var.APIGATEWAY-MANAGEMENT["PUBLISHER_NAME"]
  publisher_email     = var.APIGATEWAY-MANAGEMENT["PUBLISHER_EMAIL"]
  sku_name            = var.APIGATEWAY-MANAGEMENT["SKU_NAME"]
}


/*
    (4).API Gateway Log Application insight connector
*/


resource "azurerm_api_management_logger" "mystorekeeper-api-logger" {
  name                = var.APIGATEWAY-MANAGEMENT["LOGER_NAME"]
  api_management_name = azurerm_api_management.mystroekeeper-apigateway.name
  resource_group_name = azurerm_resource_group.mystroekeeper-apimanagement-rg.name

  application_insights {
    instrumentation_key = azurerm_application_insights.mystroekeeper-apigateway-insight.instrumentation_key
  }
}
