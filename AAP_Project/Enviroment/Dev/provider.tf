terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.106.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "AbhishekKeyvalutRG_donotdelete"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "storageaccountstatefile"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstatefilecontainer"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev1.terraform.tfstate" 
}
}

provider "azurerm" {
  features {
    
  }
}