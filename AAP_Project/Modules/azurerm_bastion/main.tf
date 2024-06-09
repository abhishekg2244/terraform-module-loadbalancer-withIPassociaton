resource "azurerm_public_ip" "pipblock" {
    for_each = var.bastion
  name                = each.value.bastionpublicip
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku = each.value.sku
}

resource "azurerm_bastion_host" "example" {
    for_each = var.bastion
  name                = each.value.bastionname 
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                 = "configuration"
    subnet_id            =data.azurerm_subnet.datasubentblock[each.key].id
    public_ip_address_id = azurerm_public_ip.pipblock[each.key].id
  }
}