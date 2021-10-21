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

data "azurerm_key_vault" "res_kv" {
  name                = "testkeyvaultz"
  resource_group_name = "terraform-course"
}

data "azurerm_key_vault_secret" "res_sec" {
  name         = "sqlpassword"
  key_vault_id = data.azurerm_key_vault.res_kv.id
}


resource "azurerm_sql_server" "res_sql" {
  name                         = "testsqlserverz"
  resource_group_name          = "terraform-course"
  location                     = "West Europe"
  version                      = "12.0"
  administrator_login          = "adminz"
  administrator_login_password = data.azurerm_key_vault_secret.res_sec.value

}

resource "azurerm_sql_database" "res_db" {
  name                = "testsqldatabase"
  resource_group_name = "terraform-course"
  location            = "West Europe"
  server_name         = azurerm_sql_server.res_sql.name

}