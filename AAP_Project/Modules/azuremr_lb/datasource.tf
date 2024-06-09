
data "azurerm_virtual_machine" "datavm1"{
  for_each = var.lb
   name =each.value.vmname1
   resource_group_name = each.value.resource_group_name

}
data "azurerm_virtual_machine" "datavm2"{
  for_each = var.lb
    name =each.value.vmname2
   resource_group_name = each.value.resource_group_name

}

data "azurerm_virtual_network" "datavnet" {
  for_each = var.lb
  name                = each.value.virtual_network_name 
  resource_group_name = each.value.resource_group_name
}

