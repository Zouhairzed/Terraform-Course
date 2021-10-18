terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-tfstate-backend"
    storage_account_name  = "tfstatestorageaccountz"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}