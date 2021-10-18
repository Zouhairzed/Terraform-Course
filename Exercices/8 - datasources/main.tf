provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.78.0"
    }
  }
}


data "azurerm_storage_container" "datacontainer" {
  name                 = "tfstate"
  storage_account_name = "tfstatestorageaccountzz"
}

output "datacontainer" {
    value = data.azurerm_storage_container.datacontainer
}
