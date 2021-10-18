data "azurerm_storage_container" "datacontainer" {
  name                 = "tfstate"
  storage_account_name = "tfstatestorageaccountz"
}

output "datacontainer" {
    value = data.datacontainer.metadata
}