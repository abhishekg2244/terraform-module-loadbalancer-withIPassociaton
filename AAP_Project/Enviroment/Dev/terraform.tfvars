rgs = {
    rg1 ={
        name = "aap_dev_rg"
        location = "west us"
    }
}

vnet = {
    vnet1= {
   name                = "dev-vnet"
  location            = "west us"
  resource_group_name = "aap_dev_rg"
  address_space       = ["10.0.0.0/16"]     
    }
}

subnet = {
    subnet1={
  name                 = "dev-frontendsubnet"
  resource_group_name  = "aap_dev_rg"
  virtual_network_name = "dev-vnet"
  address_prefixes     = ["10.0.1.0/24"]
    }

    subnet2={
  name                 = "AzureBastionSubnet"
  resource_group_name  = "aap_dev_rg"
  virtual_network_name = "dev-vnet"
  address_prefixes     = ["10.0.2.0/27"]
    }
}

linuxvm = {
    vm1 ={
      nic-name = "dev-frontendvm1-nic"  
      location = "west us"
      resource_group_name = "aap_dev_rg"
      vm-name = "dev-frontendvm1"
      datasubnet = "dev-frontendsubnet"
      virtual_network_name = "dev-vnet"
      size                = "Standard_B2s"

     
      os_disk ={
        disk1={
           caching              = "ReadWrite"
           storage_account_type = "Standard_LRS" 
        }
      }
      imagerefrence ={
        image1 ={
            publisher = "Canonical"
           offer     = "0001-com-ubuntu-server-focal"
           sku       = "20_04-lts"
           version   = "latest"
          }
      }
    }

    vm2 ={
      nic-name = "dev-frontendvm2-nic"  
      location = "west us"
      resource_group_name = "aap_dev_rg"
      vm-name = "dev-frontendvm2"
      datasubnet = "dev-frontendsubnet"
      virtual_network_name = "dev-vnet"
      size                = "Standard_B2s"
      
      

      os_disk ={
        disk1={
           caching              = "ReadWrite"
           storage_account_type = "Standard_LRS"
        }
      }
      imagerefrence ={
        image1 ={
            publisher = "Canonical"
           offer     = "0001-com-ubuntu-server-focal"
           sku       = "20_04-lts"
           version   = "latest"
          }
      }
    }
    }

lb = {
  lb1 = {
  lbpip                = "lbpublicip"
  resource_group_name = "aap_dev_rg"
  location            = "west us"
  allocation_method   = "Static"
  lbname = "applicaitonlb"
  backendpool = "pool1"
  virtual_network_name = "dev-vnet"
  vmname1 = "dev-frontendvm1"
  vmname2 = "dev-frontendvm2"
  
  }
}

bastion = {
  bastion1={
  bastionname          = "jumpbox"
  bastionpublicip      = "bastionpublicip"
  resource_group_name  = "aap_dev_rg"
  location             = "west us"
  allocation_method    = "Static"
  sku                  = "Standard" 
  bastiondatasubnet    = "AzureBastionSubnet"
  resource_group_name  = "aap_dev_rg"
  virtual_network_name = "dev-vnet"
  }
}