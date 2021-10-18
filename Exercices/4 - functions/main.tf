#------------------------------------------------------
# count, list
#------------------------------------------------------

variable "apps_names" {
  type    = list(string)
  default = ["frontend", "backend", "database"]
}

resource "azurerm_resource_group" "demo4_rg" {
  count    = length(var.apps_names)
  name     = var.apps_names[count.index]
  location = var.location
}


#####################################
# element, split, lookup
#####################################

variable "environment" {
default = {
    "test" = "us-east-1"
    "prod" = "us-west-2"
  }
}

variable "availzone" {
  description = "Availability Zones Mapping"
  default = {
    "us-east-1" = "us-east-1a,us-east-1b,us-east-1c"
    "us-west-2" = "us-west-2a,us-west-2b,us-east-1c"
  }
}

output "availabiltyzones" {
  value = "${element(split(",", lookup(var.availzone,var.environment.prod)), 1)}"
}