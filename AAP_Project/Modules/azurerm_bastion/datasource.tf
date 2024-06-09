data "azurerm_subnet" "datasubentblock" {
    for_each = var.bastion
  name                 = each.value.bastiondatasubnet 
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}