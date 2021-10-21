terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-tfstate-backend"
    storage_account_name  = "tfstatestorageaccountzz"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}