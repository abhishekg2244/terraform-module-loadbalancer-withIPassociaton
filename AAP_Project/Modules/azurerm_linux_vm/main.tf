resource "azurerm_network_interface" "nic-block" {
    for_each = var.linuxvm
  name                = each.value.nic-name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  

  ip_configuration {
    name  = "internal"
    subnet_id = data.azurerm_subnet.datasubentblock[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linuxvmblock" {
    for_each = var.linuxvm
  name                = each.value.vm-name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.size
  admin_username      = "adminuser"
  admin_password = "Qwertyuiop@123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic-block[each.key].id,
  ]

 

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching              = os_disk.value.caching
    storage_account_type = os_disk.value.storage_account_type
    }
    
  }

  dynamic "source_image_reference" {
    for_each = each.value.imagerefrence
    content {
      publisher = source_image_reference.value.publisher
     offer     = source_image_reference.value.offer
     sku       = source_image_reference.value.sku
     version   = source_image_reference.value.version
    }
    
  }
}