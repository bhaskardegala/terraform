variable "client_id" {
  type    = "string"
  description = "please enter your client id"
}

variable "client_secret" {
  type    = "string"
  description = "please enter your client secret"
}

variable "subscription_id" {
  type    = "string"
  description = "please enter your subscription id"
}

variable "tenant_id" {
  type    = "string"
  description = "please enter your tenant id"
}

variable "location" {
  type    = "string"
  description = "In which location you are desired to create your resource"
}

variable "username_web_vm" {
  type    = "string"
  description = "please enter your user name which is used as login creadential for web_vm"
}

variable "password_web_vm" {
  type    = "string"
  description = "please enter your password which is used as login creadential for web_vm"
}

variable "username_business_vm" {
  type    = "string"
  description = "please enter your user name which is used as login creadential for business_vm"
}

variable "password_business_vm" {
  type    = "string"
  description = "please enter your password which is used as login creadential for business_vm"
}

variable "username_db_vm" {
  type    = "string"
  description = "please enter your user name which is used as login creadential for db_vm"
}

variable "password_db_vm" {
  type    = "string"
  description = "please enter your password which is used as login creadential for db_vm"
}
