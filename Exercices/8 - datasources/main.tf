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


# data "azurerm_virtual_network" "example" {
#   name                = "vnet_test"
#   resource_group_name = "terraform-tfstate-backend"
# }

# output "subnets" {
#     value = data.azurerm_virtual_network.example.subnets
# }


data "azurerm_subnet" "example" {
  name                 = "subnet_test"
  virtual_network_name = "vnet_test"
  resource_group_name  = "terraform-tfstate-backend"
}

output "ips" {
value = data.azurerm_subnet.example.address_prefixes

}
