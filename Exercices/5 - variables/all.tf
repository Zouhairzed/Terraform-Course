#########################
### List Variable
#########################

variable "users" {
  type    = list
  default = ["dev", "admin", "test"]
}

}
resource "aws_iam_user" "iamuser" {
  count = length(var.users)
  name = "user-${var.users[count.index]}"
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
