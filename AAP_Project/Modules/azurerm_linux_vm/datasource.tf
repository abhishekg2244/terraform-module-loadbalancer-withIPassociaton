data "azurerm_subnet" "datasubentblock" {
    for_each = var.linuxvm
  name                 = each.value.datasubnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}