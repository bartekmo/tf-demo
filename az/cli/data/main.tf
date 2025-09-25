terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f7f4728a-781f-470f-b029-bac8a9df75af"
}

provider "azapi" {
}


data "azapi_resource_action" "locations" {
  type        = "Microsoft.Resources/subscriptions/locations@2021-04-01"
  resource_id = "/subscriptions/f7f4728a-781f-470f-b029-bac8a9df75af/locations"
  #  resource_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/locations"
  method = "GET"
}

# data "azurerm_subscription" "current" {}

output "azure_locations" {
  value = data.azapi_resource_action.locations.output
}
