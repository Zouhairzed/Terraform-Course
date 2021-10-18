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

#########################
### List Variable
#########################

variable "users" {
  type    = list
  default = ["dev", "admin", "test"]
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "azuread_user" "example" {
  count = length(var.users)
  user_principal_name = "z-test-user-${var.users[count.index]}@pwc.com"
  display_name        = "z-test-user-${var.users[count.index]}"
  password   = random_password.password.result
}


#########################
### Map Variable
#########################

variable "env" {
  type = map
  default = {
    "PROD"  = "READ"
    "DEV" = "READWRITE"
    "TEST" = "FULL"
  }
}

output "test" {
  value = lookup(var.env, "PROD")
  #value = var.env["PROD"]
}
