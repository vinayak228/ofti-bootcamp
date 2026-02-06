terraform {

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "vinayak-bootcamp"
    storage_account_name = "tfstateaog5y"
    container_name = "tfstate"
    key = "envs/dev/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}