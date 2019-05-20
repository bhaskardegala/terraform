module "ntier_arch" {
  source = "./modules/ntier_arch"

  client_id            = "${var.client_id}"
  client_secret        = "${var.client_secret}"
  subscription_id      = "${var.subscription_id}"
  tenant_id            = "${var.tenant_id}"
  location             = "${var.location}"
  username_web_vm      = "${var.username_web_vm}"
  password_web_vm      = "${var.password_web_vm}"
  username_business_vm = "${var.username_business_vm}"
  password_business_vm = "${var.password_business_vm}"
  username_db_vm       = "${var.username_db_vm}"
  password_db_vm       = "${var.password_db_vm}"
}
