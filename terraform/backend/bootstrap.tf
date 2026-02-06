provider "azurerm" {
  features {}
}

############################
# Storage Account
############################
resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "tfstate${random_string.rand.result}" # must be globally unique
  resource_group_name      = "vinayak-bootcamp"
  location                 = "northeurope"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version          = "TLS1_2"
  allow_nested_items_to_be_public = false

  # Security best practices
  shared_access_key_enabled       = true
  public_network_access_enabled   = true
  https_traffic_only_enabled      = true

  blob_properties {
    versioning_enabled = true
  }

  tags = {
    purpose = "terraform-backend"
  }
}

############################
# Random suffix for uniqueness
############################
resource "random_string" "rand" {
  length  = 5
  upper   = false
  special = false
}

############################
# Blob container for tfstate
############################
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  container_access_type = "private"
  storage_account_id = azurerm_storage_account.tfstate_sa.id
}
