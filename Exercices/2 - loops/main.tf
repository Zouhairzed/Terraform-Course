#------------------------------------------------------
# for_each
#------------------------------------------------------


variable "allowed_locations" {
  type    = list(string)
  default = ["westeurope", "eastus", "westus"]
}

resource "azurerm_resource_group" "demo2-1_rg" {
  for_each = var.allowed_locations
  name     = each.key
  location = each.value
}

#------------------------------------------------------
# count
#------------------------------------------------------

resource "azurerm_resource_group" "demo2-2_rg" {
  count    = 3
  name     = "app-${count.index}"
  location = "westeurope"
}