
/*
    (1). Setup terraform configurations
    by setting up the required providers
    and backend configurations.
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "azMyStoreKeeperConfigurationsRG"
    storage_account_name = "mystorekeeperconfigs"
    container_name       = "terraform-configs"
    key                  = "mystorekeeper.appconfig.tfstate"
  }
}


/*
    (2). Configure providerr
*/


provider "azurerm" { 
  features {}
  subscription_id = var.SUBSCRIPTION
}