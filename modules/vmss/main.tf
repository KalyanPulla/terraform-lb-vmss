resource "azurerm_linux_virtual_machine_scale_set" "main" {
  name                = "${var.component_name}-${var.env}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  sku            = "Standard_B2ts_v2"
  instances      = 2
  admin_username = "devops"
  admin_password = "devops@12345"

  disable_password_authentication = false

  source_image_id = var.image_id

  secure_boot_enabled = true
  vtpm_enabled        = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "${var.component_name}-${var.env}"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}
