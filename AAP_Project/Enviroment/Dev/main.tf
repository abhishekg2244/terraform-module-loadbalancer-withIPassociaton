variable "rgs" {}
variable "vnet" {}
variable "subnet" {}
variable "linuxvm" {}
variable "lb" {}
variable "bastion" {
  
}

module "rgmodule" {
  source = "../../Modules/azurerm_rg"
  rgs = var.rgs
}

module "vnet" {
  depends_on = [ module.rgmodule ]
  source = "../../Modules/azurerm_vnet"
  vnet =var.vnet
  
}

module "subnet" {
  depends_on = [ module.rgmodule,module.vnet ]
  source = "../../Modules/azurerm_subnet"
  subnet = var.subnet
  
}


module "linuxvm" {
  depends_on = [ module.rgmodule,module.vnet,module.subnet ]
  source = "../../Modules/azurerm_linux_vm"
  linuxvm = var.linuxvm

}

module "lb" {
  depends_on = [ module.rgmodule,module.vnet,module.subnet,module.linuxvm ]
  source = "../../Modules/azuremr_lb"
  lb = var.lb
  
}

module "bastion" {
  depends_on = [ module.rgmodule,module.vnet,module.subnet]
  source = "../../Modules/azurerm_bastion"
  bastion = var.bastion
  
}