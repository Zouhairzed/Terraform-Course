#------------------------------------------------------
# if, else
#------------------------------------------------------

resource "azurerm_resource_group" "demo3_rg" {
  name     = "dev-rg"
  location = var.location != "" ? var.location : "westeurope"
}
