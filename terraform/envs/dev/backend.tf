terraform {

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "vinayak-bootcamp"
    storage_account_name = "vinayak-tfstate" # storage account name
    container_name = "tfstate"
    key = "envs/dev/terraform.tfstate"
  }
}
