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
  storage_account_name = "tfstatestorageaccountz"
}

output "datacontainer" {
    value = data.datacontainer.metadata
}
